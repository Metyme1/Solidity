// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Voting.sol";

contract Target {
    address public sender;

    function mint() external {
        sender = msg.sender;
    }
}

contract VotingTest is Test {
    Voting public voting;
    Target public target;
    address[] members;

    function setUp() public {
        target = new Target();

        for(uint160 i = 2; i <= 11; i++) {
            members.push(address(i));
        }
        voting = new Voting(members);
        voting.newProposal(address(target), abi.encodeWithSignature("mint()"));
        
        for(uint160 i = 2; i <= 10; i++) {
            vm.prank(address(i));
            voting.castVote(0, true);
        }
    }

    function testStateBefore() public {
        assertEq(target.sender(), address(0), "the target should not have been called until 10 supporting votes");
    }

    function testStateAfter() public {
        vm.prank(address(11));
        voting.castVote(0, true);
        assertEq(target.sender(), address(voting), "the proposal should have been executed after 10 supporting votes");
    }
}

