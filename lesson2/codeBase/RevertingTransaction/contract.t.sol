// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Contract.sol";

contract ContractTest is Test {
    Contract public myContract;

    function testSuccess() public {
        myContract = new Contract{ value: 1 ether }();
        assertFalse(address(myContract) == address(0));
    }

    function testFailure() public {
        myContract = new Contract{ value: 0.5 ether }();
        assertEq(address(myContract), address(0));
    }
}
