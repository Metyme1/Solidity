// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./Enemy.sol";

contract Hero {
	uint public health;
	uint public energy = 10;
	constructor(uint _health) {
		health = _health;
	}

	enum AttackTypes { Brawl, Spell }
	function attack(Enemy) public virtual {
		energy--;
	}
}

