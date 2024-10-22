// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8;

import {Script} from "lib/forge-std/src/Script.sol";
import {NemiNft} from "src/NemiNft.sol";
import {console} from "lib/forge-std/src/console.sol";


contract DeployNemiNft is Script {
    function run() external returns (NemiNft) {
        vm.startBroadcast();
        NemiNft nemiNft = new NemiNft();
        vm.stopBroadcast();
        return nemiNft;

    }
}
