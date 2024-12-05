// SPDX-License-Identifier: MIT
// CC = 5
//Role-based access for transitions.


pragma solidity ^0.8.0;

contract RoleBasedStateMachine {
    enum State { Created, InProgress, Completed }
    State public currentState;
    address public admin;

    constructor() {
        admin = msg.sender;
        currentState = State.Created;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not the admin");
        _;
    }

    function startProgress() public onlyAdmin {
        require(currentState == State.Created, "Invalid state");
        currentState = State.InProgress;
    }

    function complete() public onlyAdmin {
        require(currentState == State.InProgress, "Invalid state");
        currentState = State.Completed;
    }
}
