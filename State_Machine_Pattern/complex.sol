// SPDX-License-Identifier: MIT
// CC = 8

pragma solidity ^0.8.0;

contract HighCCStateMachine {
    enum State { Created, InProgress, Paused, Cancelled, Completed }
    State public currentState;
    address public admin;

    constructor() {
        admin = msg.sender;
        currentState = State.Created;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    function startProgress() public onlyAdmin {
        require(currentState == State.Created, "Invalid state");
        currentState = State.InProgress;
    }

    function pause() public onlyAdmin {
        require(currentState == State.InProgress, "Invalid state");
        currentState = State.Paused;
    }

    function cancel() public onlyAdmin {
        require(currentState != State.Completed, "Cannot cancel completed");
        currentState = State.Cancelled;
    }

    function complete() public onlyAdmin {
        require(currentState == State.InProgress, "Invalid state");
        currentState = State.Completed;
    }
}
