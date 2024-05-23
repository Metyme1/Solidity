// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "./Contract.sol";

contract ContractTest is Test {
    Contract public myContract;

    function setUp() public {
        myContract = new Contract();
    }

    function testFoods() public {
        Contract.Foods food1 = myContract.food1();
        Contract.Foods food2 = myContract.food2();
        Contract.Foods food3 = myContract.food3();
        Contract.Foods food4 = myContract.food4();

        // enums can be translated to uint8 based on their position
        // the first option is 0, then 1, 2, 3 etc...
        uint enumSum = uint8(food1) + uint8(food2) + uint8(food3) + uint8(food4);
        assertGe(enumSum, 6);
    }
}