// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract Voting {
    address public owner;

    modifier onlyOwner() {
        require(owner == msg.sender, "Only owner can call this function");
        _;
    }

    modifier isAlreadyVoted(address _voter) {
        require(!voters[_voter].voted, "The user already voted!");
        _;
    }

    struct Voter {
        bool voted;
        uint vote;
    }

    struct Proposal {
        string name;
        uint voteCount;
    }

    mapping(address => Voter) internal voters;
    Proposal[] internal proposals;

    constructor() {
        owner = msg.sender;
    }

    function addProposal(string memory _name) public onlyOwner {
        proposals.push(Proposal({
            name: _name,
            voteCount: 0
        }));
    }

    function vote(uint _proposal) public isAlreadyVoted(msg.sender) {
        voters[msg.sender].voted = true;
        voters[msg.sender].vote = _proposal;
        proposals[_proposal].voteCount += 1;
    }
}
