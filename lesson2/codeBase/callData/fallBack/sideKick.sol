// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sidekick {
    function makeContact(address hero) external {
        // send over any calldata that doesnt match existing signatures!
        (bool success, ) = hero.call(
            abi.encodeWithSignature("")
        );

        require(success);
    }
}