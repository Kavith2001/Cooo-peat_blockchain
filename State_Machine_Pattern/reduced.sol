// SPDX-License-Identifier: MIT
// CC = 4

pragma solidity ^0.8.0;

contract ReducedCCStateMachine {
    enum State { Created, InProgress, Paused, Cancelled, Completed }
    State public currentState;
    address public admin;

    mapping(State => State[]) public validTransitions;

    constructor() {
        admin = msg.sender;
        currentState = State.Created;

        validTransitions[State.Created] = [State.InProgress];
        validTransitions[State.InProgress] = [State.Paused, State.Completed];
        validTransitions[State.Paused] = [State.InProgress];
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    function transitionTo(State _newState) internal {
        bool valid = false;
        for (uint i = 0; i < validTransitions[currentState].length; i++) {
            if (validTransitions[currentState][i] == _newState) {
                valid = true;
                break;
            }
        }
        require(valid, "Invalid state transition");
        currentState = _newState;
    }

    function startProgress() public onlyAdmin {
        transitionTo(State.InProgress);
    }

    function pause() public onlyAdmin {
        transitionTo(State.Paused);
    }

    function complete() public onlyAdmin {
        transitionTo(State.Completed);
    }
}


// Using state transaction table to validate state transitions. - Reduced repetitive checks by introducing 
//a mapping to define valid transitions.

//Creating reuable functions