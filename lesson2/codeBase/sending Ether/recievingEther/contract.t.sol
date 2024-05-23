// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Contract.sol";

contract ContractTest is Test {
    Contract public myContract;
    address msgSender = address(3);

    function setUp() public {
        hoax(msgSender);
        myContract = new Contract();
    }

    function testSendEther() public {
        address contractAddr = address(myContract);

        // send 2 ether without any calldata
        contractAddr.call{ value: 2 ether }("");
        
        assertEq(contractAddr.balance, 2 ether);
    }
}
