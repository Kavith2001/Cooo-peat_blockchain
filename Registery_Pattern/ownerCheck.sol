// SPDX-License-Identifier: MIT
// CC = 2
//Added ownership check with a modifier.

pragma solidity ^0.8.0;

contract OwnedRegistry {
    address public owner;
    address public registered;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    function register(address _address) public onlyOwner {
        registered = _address;
    }
}
