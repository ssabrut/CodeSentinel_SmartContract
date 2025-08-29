// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract Voting {
    address public owner;

    struct Voter {
        bool voted;
        address delegate;
        uint vote;
    }

    struct Proposal {
        string name;
        uint voteCount;
    }

    mapping(address => Voter) public voters;
    mapping(address => bool) public members;
    Proposal[] public proposals;

    constructor() {
        owner = msg.sender;
    }
}
