// SPDX-License-Identifier: MIT
// CC = 8
//Complex conditions with role-based access, mapping for user roles, and additional state logic.

pragma solidity ^0.8.0;

contract ComplexStateMachine {
    enum State { Created, InProgress, Paused, Cancelled, Completed }
    State public currentState;
    address public admin;
    mapping(address => bool) public authorizedUsers;

    constructor() {
        admin = msg.sender;
        currentState = State.Created;
    }

    modifier onlyAuthorized() {
        require(msg.sender == admin || authorizedUsers[msg.sender], "Not authorized");
        _;
    }

    function addAuthorizedUser(address _user) public {
        require(msg.sender == admin, "Only admin can add");
        authorizedUsers[_user] = true;
    }

    function startProgress() public onlyAuthorized {
        require(currentState == State.Created, "Invalid state");
        currentState = State.InProgress;
    }

    function pause() public onlyAuthorized {
        require(currentState == State.InProgress, "Invalid state");
        currentState = State.Paused;
    }

    function cancel() public onlyAuthorized {
        require(currentState != State.Completed, "Cannot cancel completed");
        currentState = State.Cancelled;
    }

    function complete() public onlyAuthorized {
        require(currentState == State.InProgress, "Invalid state");
        currentState = State.Completed;
    }
}
