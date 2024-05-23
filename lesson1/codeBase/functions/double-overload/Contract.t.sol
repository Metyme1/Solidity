// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "./Contract.sol";

contract ContractTest is Test {
    Contract public myContract;

    function setUp() public {
        myContract = new Contract();
    }

    function testDouble() public {
        assertEq(myContract.double(2), 4);
        assertEq(myContract.double(4), 8);
    }

    function testDoubleWithTwoParams() public {
        (uint x, uint y) = myContract.double(2, 2);
        assertEq(x, 4);
        assertEq(y, 4);

        (uint x2, uint y2) = myContract.double(5, 10);
        assertEq(x2, 10);
        assertEq(y2, 20);
    }
}