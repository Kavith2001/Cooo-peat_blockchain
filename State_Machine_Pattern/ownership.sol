// SPDX-License-Identifier: MIT
// CC = 2
//Ownership check and transition logic

pragma solidity ^0.8.0;

contract OwnedStateMachine {
    enum State { Created, Completed }
    State public currentState;
    address public owner;

    constructor() {
        owner = msg.sender;
        currentState = State.Created;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    function complete() public onlyOwner {
        currentState = State.Completed;
    }
}
