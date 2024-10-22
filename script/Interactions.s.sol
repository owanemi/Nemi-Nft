// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8;

import {Script} from "lib/forge-std/src/Test.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {NemiNft} from "src/NemiNft.sol";

contract MintNemiNft is Script {

    string public constant NEMI_PFP_URI = "https://gateway.pinata.cloud/ipfs/QmUGmoeNaVSfS8aULgRAmg4vqTYcUoafFPMdLv4W8sKCun/";

    address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("NemiNft", block.chainid);
    mintNftOnContract(mostRecentlyDeployed);

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        NemiNft(contractAddress).mintNft(NEMI_PFP_URI);
        vm.stopBroadcast();
    }
}
