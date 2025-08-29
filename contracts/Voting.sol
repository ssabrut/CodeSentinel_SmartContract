// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract Voting {
    address public owner;

    struct Voter {
        uint weight;
        bool voted;
        address delegate;
        uint vote;
    }

    struct Proposal {
        string name;
        uint voteCount;
    }

    constructor() {
        owner = msg.sender;
    }
}
