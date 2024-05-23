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
}