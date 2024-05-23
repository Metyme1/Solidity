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
    }

    function testProposal() public {
        vm.recordLogs();
        
        voting.newProposal(_target, _data);

        Vm.Log[] memory entries = vm.getRecordedLogs();

        assertEq(entries.length, 1, "there should only be one event emitted");
        assertEq(entries[0].topics[0], keccak256("ProposalCreated(uint256)"), "the first topic should be the name of the event, ProposalCreated(uint256)");
        assertEq(abi.decode(entries[0].data, (uint)), 0, "the data in the event should be the proposal id, 0");
    }

    function testVote() public {
        voting.newProposal(_target, _data);
        
        vm.recordLogs();
        
        address voter = address(2);
        vm.startPrank(voter);
        voting.castVote(0, true);
        voting.castVote(0, true);

        Vm.Log[] memory entries = vm.getRecordedLogs();

        assertEq(entries.length, 2, "there should be two vote cast events emitted");
        assertEq(entries[1].topics[0], keccak256("VoteCast(uint256,address)"), "the first topic should be the name of the event, VoteCast(uint256,address)");
    }
}

