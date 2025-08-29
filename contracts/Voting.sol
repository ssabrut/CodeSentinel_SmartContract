// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract Voting {
    address public owner;

    modifier onlyOwner() {
        require(owner == msg.sender, "Only owner can call this function");
        _;
    }

    struct Proposal {
        string name;
        uint voteCount;
        address[] voters;
    }

    Proposal[] public proposals;
    event ProposalCreated(uint _proposalId);

    constructor() {
        owner = msg.sender;
    }

    function addProposal(string memory _name) public onlyOwner {
        Proposal storage proposal = proposals.push();
        proposal.name = _name;
        proposal.voteCount = 0;

        emit ProposalCreated(proposals.length - 1);
    }
}
