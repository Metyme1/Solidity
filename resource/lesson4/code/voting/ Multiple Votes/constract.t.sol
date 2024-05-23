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
        
        vm.prank(address(2));
        voting.castVote(0, true);
        vm.prank(address(3));
        voting.castVote(0, true);
        vm.prank(address(4));
        voting.castVote(0, false);
    }

    function testProposal() public {
        (,, uint yesCount, uint noCount) = voting.proposals(0);
        assertEq(yesCount, 2);   
        assertEq(noCount, 1);  
    }

    function testSwitchFromSupports() public {
        vm.prank(address(2));
        voting.castVote(0, false);
        vm.prank(address(3));
        voting.castVote(0, false);

        (,, uint yesCount, uint noCount) = voting.proposals(0);
        assertEq(yesCount, 0);   
        assertEq(noCount, 3);  
    }

    function testSwitchToSupports() public {
        vm.prank(address(4));
        voting.castVote(0, true);

        (,, uint yesCount, uint noCount) = voting.proposals(0);
        assertEq(yesCount, 3);   
        assertEq(noCount, 0);  
    }
}

