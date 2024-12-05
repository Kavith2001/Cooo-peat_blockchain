// SPDX-License-Identifier: MIT
// CC = 8

pragma solidity ^0.8.0;

contract HighCCRegistry {
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
        if (_level > 5) {
            revert("Access level too high");
        } else if (_level < 1) {
            revert("Access level too low");
        } else {
            accessLevel[_address] = _level;
            isRegistered[_address] = true;
        }
    }

    function unregister(address _address) public onlyAdmin {
        require(isRegistered[_address], "Not registered");
        isRegistered[_address] = false;
    }
}
