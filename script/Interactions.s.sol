// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {DeployDogieNft} from "./DeployDogieNft.s.sol";
import {DogieNft} from "../src/DogieNft.sol";

contract MintDogieNft is Script {
    string public constant ST_BERNARD = "ipfs://Qme4pQqxVTFGLZ88rFHRz2Hw2Ae5xWRAxNc6DPioyraFvb";

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("DogieNft", block.chainid);
        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        DogieNft(contractAddress).mintNft(ST_BERNARD);
        vm.stopBroadcast();
    }
}
