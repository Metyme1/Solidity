// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Contract.sol";

contract ContractTest is Test {
    Contract public myContract;
    address owner = address(2);

    function setUp() public {
        hoax(owner);
        myContract = new Contract{ value: 1 ether }();
    }

    function testAsOwner() public {
        vm.prank(owner);
        uint balanceBefore = address(owner).balance;
        myContract.withdraw();
        uint balanceAfter = address(owner).balance;
        assertEq(balanceAfter - balanceBefore, 1 ether);
    }

    function testAsNotOwner() public {
        vm.prank(address(3));
        vm.expectRevert();
        myContract.withdraw();
    }
}
