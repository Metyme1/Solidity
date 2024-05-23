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
        collectible.transfer(address(4));

        vm.startPrank(address(4));
        collectible.markPrice(10);
        assertEq(collectible.price(), 10);
    }

    function testAsNonOwner() public {
        vm.startPrank(address(2));

        vm.expectRevert();
        collectible.markPrice(5);

        vm.expectRevert();
        collectible.transfer(address(4));
    }
}

