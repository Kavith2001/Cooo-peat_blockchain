// SPDX-License-Identifier: MIT
// CC = 3
//Introduced mapping for multiple registrations

pragma solidity ^0.8.0;

contract MappingRegistry {
    mapping(address => bool) public isRegistered;

    function register(address _address) public {
        isRegistered[_address] = true;
    }

    function isRegisteredUser(address _address) public view returns (bool) {
        return isRegistered[_address];
    }
}
