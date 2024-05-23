// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Hero {
	uint public health = 100;

	function takeDamage(uint damage) public {
		health -= damage;
	}
}
