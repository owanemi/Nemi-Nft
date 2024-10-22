// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8;

import {Test} from "lib/forge-std/src/Test.sol";
import {NemiNft} from "src/NemiNft.sol";
import {DeployNemiNft} from "script/DeployNemiNft.s.sol";
import {console} from "lib/forge-std/src/console.sol";

contract NemiNftTest is Test {

    DeployNemiNft public deployer;
    NemiNft public nemiNft;

    address public minter = makeAddr("first-minter");

    string public constant NEMI_PFP_URI = "https://gateway.pinata.cloud/ipfs/QmUGmoeNaVSfS8aULgRAmg4vqTYcUoafFPMdLv4W8sKCun/";

    function setUp() public {
        deployer = new DeployNemiNft();
        nemiNft = deployer.run();
    }

    function testNameAndSymbolIsCorrect() public view {
        string memory expectedName = "owanemi-twitter-pfp";
        string memory actualName = nemiNft.name();

        assert(keccak256(abi.encodePacked(expectedName)) == keccak256(abi.encodePacked(actualName)));

        string memory expectedSymbol = "NEMI";
        string memory actualSymbol = nemiNft.symbol();

        assert(keccak256(abi.encodePacked(expectedSymbol)) == keccak256(abi.encodePacked(actualSymbol)));

    }

    function testCanMint() public {
        vm.prank(minter);
        nemiNft.mintNft(NEMI_PFP);

        assert(nemiNft.balanceOf(minter) == 1);
        assert(keccak256(abi.encodePacked(NEMI_PFP)) == keccak256(abi.encodePacked(nemiNft.tokenURI(0))));

    }
}
