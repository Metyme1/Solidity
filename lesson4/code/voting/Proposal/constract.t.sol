// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Voting.sol";

contract VotingTest is Test {
    Voting public voting;
     bytes public _data = abi.encodePacked(bytes2(0x1337));
    address _target = address(1337);

    function setUp() public {
        voting = new Voting();
        voting.newProposal(_target, _data);
    }

    function testProposal() public {
        (address target, bytes memory data, uint yesCount, uint noCount) = voting.proposals(0);
        assertEq(target, _target);
        assertEq(data, _data);
        assertEq(yesCount, 0);   
        assertEq(noCount, 0);   
    }
}

