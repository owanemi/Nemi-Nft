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
    vm.deal(minter, 1 ether);

    string public constant NEMI_URI = "https://gateway.pinata.cloud/ipfs/QmYATdQebFatAvLZ4JeZ3PySzP7da3dqqLuwVQfD9Qg27F"

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

    function canMintAndHaveABalance() public {
        vm.prank(minter);

        nemiNft.mintNft()
    }
}
