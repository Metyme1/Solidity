// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "./Contract.sol";

contract ContractTest is Test {
    Contract public myContract;

    function setUp() public {
        myContract = new Contract();
    }

    function testMsg1() public {
        assertEq(myContract.msg1(), "Hello World");
    }

    function testMsg2Length() public {
        assertGt(bytes(myContract.msg2()).length, 32);
    }
}