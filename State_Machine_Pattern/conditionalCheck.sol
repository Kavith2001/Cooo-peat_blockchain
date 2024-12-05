// SPDX-License-Identifier: MIT
// CC = 4
//Additional states with conditional logic for transitions.

pragma solidity ^0.8.0;

contract ConditionalStateMachine {
    enum State { Created, InProgress, Paused, Completed }
    State public currentState;

    constructor() {
        currentState = State.Created;
    }

    function startProgress() public {
        require(currentState == State.Created, "Invalid state");
        currentState = State.InProgress;
    }

    function pause() public {
        require(currentState == State.InProgress, "Invalid state");
        currentState = State.Paused;
    }

    function resume() public {
        require(currentState == State.Paused, "Invalid state");
        currentState = State.InProgress;
    }

    function complete() public {
        require(currentState == State.InProgress, "Invalid state");
        currentState = State.Completed;
    }
}
