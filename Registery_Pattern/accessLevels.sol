// SPDX-License-Identifier: MIT
// CC = 8
//Access levels and multi-condition logic

pragma solidity ^0.8.0;

contract AccessLevelRegistry {
    address public admin;
    mapping(address => uint) public accessLevel;
    mapping(address => bool) public isRegistered;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not the admin");
        _;
    }

    function setAccessLevel(address _address, uint level) public onlyAdmin {
        accessLevel[_address] = level;
    }

    function register(address _address) public {
        require(accessLevel[_address] > 1, "Access level too low");
        isRegistered[_address] = true;
    }

    function unregister(address _address) public {
        require(isRegistered[_address], "Address not registered");
        isRegistered[_address] = false;
    }
}
