// SPDX-License-Identifier: MIT
// CC = 7
//Event emissions for each state change, increasing conditional and functional paths.

pragma solidity ^0.8.0;

contract EventStateMachine {
    enum State { Created, InProgress, Paused, Completed }
    State public currentState;
    address public admin;

    event StateChanged(State newState);

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
        emit StateChanged(currentState);
    }

    function pause() public onlyAdmin {
        require(currentState == State.InProgress, "Invalid state");
        currentState = State.Paused;
        emit StateChanged(currentState);
    }

    function resume() public onlyAdmin {
        require(currentState == State.Paused, "Invalid state");
        currentState = State.InProgress;
        emit StateChanged(currentState);
    }

    function complete() public onlyAdmin {
        require(currentState == State.InProgress, "Invalid state");
        currentState = State.Completed;
        emit StateChanged(currentState);
    }
}
