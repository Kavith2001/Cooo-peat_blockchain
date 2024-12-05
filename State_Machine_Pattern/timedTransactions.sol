// SPDX-License-Identifier: MIT
// CC = 6

pragma solidity ^0.8.0;

contract TimedStateMachine {
    enum State { Created, InProgress, Completed }
    State public currentState;
    uint public startTime;

    constructor() {
        currentState = State.Created;
    }

    function startProgress() public {
        require(currentState == State.Created, "Invalid state");
        currentState = State.InProgress;
        startTime = block.timestamp;
    }

    function complete() public {
        require(currentState == State.InProgress, "Invalid state");
        require(block.timestamp >= startTime + 1 days, "Cannot complete yet");
        currentState = State.Completed;
    }
}
