// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Escrow.sol";

contract EscrowTest is Test {
    Escrow public escrow;

    function setUp() public {
        escrow = new Escrow();
    }

    function testMethods() public {
        assertEq(escrow.arbiter(), address(0));
        assertEq(escrow.depositor(), address(0));
        assertEq(escrow.beneficiary(), address(0));
    }
}
