// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Escrow.sol";

contract EscrowTest is Test {
    Escrow public escrow;
    address arbiter = address(2);
    address depositor = address(3);
    address payable beneficiary = payable(address(4));

    function setUp() public {
        hoax(depositor);
        escrow = new Escrow{ value: 1 ether }(arbiter, beneficiary);
        
        vm.prank(arbiter);
        escrow.approve();
    }

    function testBalance() public {
        assertEq(beneficiary.balance, 1 ether);
    }
}
