// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "./Contract.sol";

contract ContractTest is Test {
    Contract public myContract;

    function setUp() public {
        myContract = new Contract();
    }

    function testSigns() public view {
        int8 a = myContract.a();
        int8 b = myContract.b();
        bool onlyAPositive = a > 0 && b < 0;
        bool onlyBPositive = b > 0 && a < 0;
        assert(onlyAPositive || onlyBPositive);
    }

    function testAbsoluteDifference() public {
        int8 a = myContract.a();
        int8 b = myContract.b();
        int16 diff = myContract.difference();
        int16 expectedDiff = (a > b) ? a - b : b - a;
        assertEq(diff, expectedDiff);
    }
}