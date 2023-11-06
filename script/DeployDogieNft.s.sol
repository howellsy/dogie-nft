// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {DogieNft} from "../src/DogieNft.sol";

contract DeployDogieNft is Script {
    function run() external returns (DogieNft) {
        vm.startBroadcast();
        DogieNft dogieNft = new DogieNft();
        vm.stopBroadcast();
        return dogieNft;
    }
}
