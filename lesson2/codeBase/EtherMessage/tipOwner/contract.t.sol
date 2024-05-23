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

    function testSendEther() public {
        address contractAddr = address(myContract);
        contractAddr.call{ value: 2 ether }("");
        assertEq(contractAddr.balance, 2 ether);
    }

    function testTip() public {
        myContract.tip{ value: 1 ether }();
        assertEq(msgSender.balance, 1 ether);
    }
}
