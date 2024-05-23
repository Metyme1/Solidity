// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "./Contract.sol";

contract ContractTest is Test {
    Contract public myContract;

    function setUp() public {
        myContract = new Contract(5);
    }

    function testConstructor() public {
        assertEq(myContract.x(), 5);
    }

    function testIncrement() public {
        myContract.increment();
        assertEq(myContract.x(), 6);
    }
}