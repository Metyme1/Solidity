// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "./Contract.sol";

contract ContractTest is Test {
    Contract public myContract;

    function setUp() public {
        myContract = new Contract();
    }

    function testA() public {
        assertLt(myContract.a(), 256);
    }

    function testB() public {
        assertGe(myContract.b(), 256);
    }

    function testSum() public {
        assertEq(myContract.a() + myContract.b(), myContract.sum());
    }
}