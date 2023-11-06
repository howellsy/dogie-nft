// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployDogieNft} from "../script/DeployDogieNft.s.sol";
import {DogieNft} from "../src/DogieNft.sol";

contract DogieNftTest is Test {
    DeployDogieNft public deployer;
    DogieNft public dogieNft;
    address public USER = makeAddr("user");
    address public SOME_OTHER_USER = makeAddr("some other user");
    string public constant ST_BERNARD = "ipfs://Qme4pQqxVTFGLZ88rFHRz2Hw2Ae5xWRAxNc6DPioyraFvb";

    function setUp() public {
        deployer = new DeployDogieNft();
        dogieNft = deployer.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "Dogie";
        string memory actualName = dogieNft.name();
        assert(keccak256(abi.encodePacked(expectedName)) == keccak256(abi.encodePacked(actualName)));
    }

    function testCanMint() public {
        vm.prank(USER);
        dogieNft.mintNft(ST_BERNARD);
        uint256 tokenId = 0;
        string memory actualUri = dogieNft.tokenURI(tokenId);
        assert(keccak256(abi.encodePacked(ST_BERNARD)) == keccak256(abi.encodePacked(actualUri)));
    }

    function testOwnerOfToken() public {
        vm.prank(USER);
        dogieNft.mintNft(ST_BERNARD);
        address owner = dogieNft.ownerOf(0);
        assert(owner == USER);
    }

    function testGetBalance() public {
        vm.prank(USER);
        dogieNft.mintNft(ST_BERNARD);
        uint256 bal = dogieNft.balanceOf(USER);
        assert(bal == 1);
    }

    function testTransferFrom() public {
        vm.prank(USER);
        dogieNft.mintNft(ST_BERNARD);
        vm.prank(USER);
        dogieNft.approve(USER, 0);
        vm.prank(USER);
        dogieNft.safeTransferFrom(USER, SOME_OTHER_USER, 0);
        address owner = dogieNft.ownerOf(0);
        assert(owner == SOME_OTHER_USER);
    }
}
