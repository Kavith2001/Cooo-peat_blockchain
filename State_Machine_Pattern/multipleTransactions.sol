// SPDX-License-Identifier: MIT
// CC = 3
//Multiple state transitions with simple checks

pragma solidity ^0.8.0;

contract MultiStateMachine {
    enum State { Created, InProgress, Completed }
    State public currentState;

    constructor() {
        currentState = State.Created;
    }

    function startProgress() public {
        require(currentState == State.Created, "Invalid state");
        currentState = State.InProgress;
    }

    function complete() public {
        require(currentState == State.InProgress, "Invalid state");
        currentState = State.Completed;
    }
}
