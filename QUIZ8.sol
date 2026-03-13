// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Quiz8 {

    string public name;
    string public studentID;
    string public teamName;

    address public owner;

    constructor(string memory _name, string memory _studentID) {
        name = _name;
        studentID = _studentID;
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can change team name");
        _;
    }

    function setTeamName(string memory _teamName) public onlyOwner {
        teamName = _teamName;
    }

}