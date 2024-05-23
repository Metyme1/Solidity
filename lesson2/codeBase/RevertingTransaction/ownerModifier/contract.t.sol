// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Contract.sol";

contract ContractTest is Test {
    Contract public myContract;
    address owner = address(2);

    function setUp() public {
        vm.prank(owner);
        myContract = new Contract();
    }

    function testAWithOwner() public {
        vm.prank(owner);
        myContract.setA(1);
        assertEq(vm.load(address(myContract), convertToBytes32(0)), convertToBytes32(1));
    }

    function testBWithOwner() public {
        vm.prank(owner);
        myContract.setB(2);
        assertEq(vm.load(address(myContract), convertToBytes32(1)), convertToBytes32(2));
    }

    function testCWithOwner() public {
        vm.prank(owner);
        myContract.setC(3);
        assertEq(vm.load(address(myContract), convertToBytes32(2)), convertToBytes32(3));
    }

    function testANotOwner() public {
        vm.expectRevert();
        myContract.setA(1);
    }

    function testBNotOwner() public {
        vm.expectRevert();
        myContract.setB(2);
    }
    
    function testCNotOwner() public {
        vm.expectRevert();
        myContract.setC(3);
    }

    function convertToBytes32(uint256 value) public pure returns (bytes32 result) {
        assembly {
            result := value
        }
    }
}
