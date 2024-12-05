// SPDX-License-Identifier: MIT
// CC = 4

pragma solidity ^0.8.0;

contract ReducedCCRegistry {
    address public admin;
    mapping(address => uint) public accessLevel;
    mapping(address => bool) public isRegistered;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    function register(address _address, uint _level) public onlyAdmin {
        require(_level >= 1 && _level <= 5, "Invalid access level");
        accessLevel[_address] = _level;
        isRegistered[_address] = true;
    }

    function unregister(address _address) public onlyAdmin {
        require(isRegistered[_address], "Not registered");
        isRegistered[_address] = false;
    }
}

// Replacing multiple access level checks with a single range check.