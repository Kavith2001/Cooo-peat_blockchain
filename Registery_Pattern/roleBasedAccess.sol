// SPDX-License-Identifier: MIT
// CC = 5
//Role-based access for registration/unregistration

pragma solidity ^0.8.0;

contract RoleBasedRegistry {
    address public admin;
    mapping(address => bool) public isRegistered;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not the admin");
        _;
    }

    function register(address _address) public onlyAdmin {
        isRegistered[_address] = true;
    }

    function unregister(address _address) public onlyAdmin {
        isRegistered[_address] = false;
    }
}
