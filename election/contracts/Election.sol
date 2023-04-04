// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0;

contract SLElection {
    // Read/write candidate
    string public candidate;

    // Constructor
    function Election () public {
       candidate = "Candidate 1";
    }
}