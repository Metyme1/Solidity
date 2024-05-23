// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Voting.sol";

contract VotingTest is Test {
    Voting public voting;
    bytes public _data = abi.encodePacked(bytes2(0x1337));
    address _target = address(1337);
    address member1 = address(2);
    address member2 = address(3);
    address nonMember = address(4);
    address[] members;

    function setUp() public {
        members.push(member1);
        members.push(member2);
        voting = new Voting(members);
        voting.newProposal(_target, _data);
        
        vm.prank(member1);
        voting.castVote(0, true);
        vm.prank(member2);
        voting.castVote(0, true);
    }

    function testProposal() public {
        (,, uint yesCount, uint noCount) = voting.proposals(0);
        assertEq(yesCount, 2);   
        assertEq(noCount, 0);  
    }

    function testVoteNonMember() public {
        vm.prank(nonMember);
        vm.expectRevert();
        voting.castVote(0, true);
    }
}

