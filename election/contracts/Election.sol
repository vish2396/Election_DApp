// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0;

contract Election {
    //Model a Candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Store accounts that have voted
    mapping(address => bool) public voters;
    // Read/write candidate
    mapping(uint => Candidate) public candidates;
    //Store Candidates Count
    uint public candidatesCount;

    //voted event
    event votedEvent (
        uint indexed _candidateId
    );
    
    // Constructor
    constructor(string memory _name1, string memory _name2) public {
        addCandidate(_name1);
        addCandidate(_name2);
    }
    
    function addCandidate (string memory _name) public {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

     function vote (uint _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender]);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount ++;

        // trigger voted event
        emit votedEvent(_candidateId);
    }
}