// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Contract.sol";

contract ContractTest is Test {
    Contract public myContract;
    address msgSender = address(3);

    function setUp() public {
        vm.prank(msgSender);
        myContract = new Contract();
    }

    function testConstructor() public {
        assertEq(myContract.owner(), msgSender);
    }
}
