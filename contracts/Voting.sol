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
        mapping(address => bool) voters;
    }

    Proposal[] public proposals;
    event ProposalCreated(uint _proposalId);
    event Vote(uint _proposalId, address indexed voters);

    constructor() payable  {
        owner = msg.sender;
    }

    function addProposal(string memory _name) public onlyOwner {
        Proposal storage proposal = proposals.push();
        proposal.name = _name;
        proposal.voteCount = 0;

        emit ProposalCreated(proposals.length - 1);
    }

    function voteProposal(uint _proposalId) public {
        Proposal storage proposal = proposals[_proposalId];
        require(!proposal.voters[msg.sender], "The user already voted!");

        proposal.voteCount++;
        proposal.voters[msg.sender] = true;

        emit Vote(_proposalId, msg.sender);
    }
}
