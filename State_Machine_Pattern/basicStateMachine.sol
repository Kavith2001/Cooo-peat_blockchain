// SPDX-License-Identifier: MIT
// CC = 1
//Basic state transition.

pragma solidity ^0.8.0;

contract BasicStateMachine {
    enum State { Created, Completed }
    State public currentState;

    constructor() {
        currentState = State.Created;
    }

    function complete() public {
        currentState = State.Completed;
    }
}
