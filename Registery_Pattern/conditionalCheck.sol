// SPDX-License-Identifier: MIT
// CC = 4
//Conditional checks for validity and registration

pragma solidity ^0.8.0;

contract ConditionalRegistry {
    mapping(address => bool) public isRegistered;

    function register(address _address) public {
        require(_address != address(0), "Invalid address");
        isRegistered[_address] = true;
    }

    function unregister(address _address) public {
        require(isRegistered[_address], "Address not registered");
        isRegistered[_address] = false;
    }
}
