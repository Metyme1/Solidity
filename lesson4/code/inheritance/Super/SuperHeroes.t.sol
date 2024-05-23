// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Hero.sol";
import "../src/SuperHeroes.sol";
import "../src/Enemy.sol";

contract EscrowTest is Test {
    Warrior public warrior;
    Mage public mage;
    Enemy public enemy;
    
    function setUp() public {
        warrior = new Warrior();
        mage = new Mage();
        enemy = new Enemy();
    }

    function testWarriorAttack() public {
        warrior.attack(enemy);
        assertEq(enemy.health(), 50);
        assertEq(warrior.energy(), 9);
    }

    function testMageAttack() public {
        mage.attack(enemy);
        assertEq(enemy.health(), 20);
        assertEq(mage.energy(), 9);
    }
}

