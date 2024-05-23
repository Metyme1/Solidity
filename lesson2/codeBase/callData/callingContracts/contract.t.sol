// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Hero.sol";
import "../src/Sidekick.sol";

contract ContractTest is Test {
    Sidekick public sidekick;
    Hero public hero;

    function setUp() public {
        hero = new Hero();
        sidekick = new Sidekick();
    }

    function testAlert() public {
        sidekick.sendAlert(address(hero));
        assertEq(hero.alerted(), true, "it should have alerted the hero");
    }
}
