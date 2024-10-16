// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import {ERC721} from "lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract NemiNft is ERC721 {
    uint256 private s_tokenCounter;
    mapping(uint256 => string) private s_tokenIdToUri;

    constructor() ERC721("owanemi-twitter-pfp", "NEMI"){
        s_tokenCounter = 0;
    }
}

function mintNft(string memory tokenUri) {
    s_tokenIdToUri[s_tokenCounter] = tokenUri
    _safeMint(msg.sender, s_tokenCounter);
    s_tokenCounter++;
}

function tokenURI(uint256 tokenId) oublic view override returns (string memory) {
    return s_tokenIdToUri(tokenId);
}