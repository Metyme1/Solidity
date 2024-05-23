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

    function testAlert1() public {
        sidekick.relay(address(hero), abi.encodeWithSignature("alert(uint256,bool)", 5, true));
        (bool alerted, uint enemies, bool armed) = hero.ambush();
        assertEq(alerted, true, "it should have alerted the hero");
        assertEq(enemies, 5, "it should have let the hero know theres 5 enemies");
        assertEq(armed, true, "it should have let the hero know the enemies are armed");
    }

    function testAlert2() public {
        sidekick.relay(address(hero), abi.encodeWithSignature("alert(uint256,bool)", 2, false));
        (bool alerted, uint enemies, bool armed) = hero.ambush();
        assertEq(alerted, true, "it should have alerted the hero");
        assertEq(enemies, 2, "it should have let the hero know theres 2 enemies");
        assertEq(armed, false, "it should have let the hero know the enemies are not armed");
    }
}
