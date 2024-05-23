// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/BaseContracts.sol";
import "../src/Collectible.sol";

contract OwnableTest is Test {
    Collectible public collectible;

    function setUp() public {
        collectible = new Collectible();
    }

    function testAsOwner() public {
        collectible.markPrice(5);
    }

    function testAsNonOwner() public {
        vm.prank(address(2));
        vm.expectRevert();
        collectible.markPrice(5);
    }
}
