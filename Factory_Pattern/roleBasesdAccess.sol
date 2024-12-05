// SPDX-License-Identifier: MIT
// CC = 6
// Factory pattern with role-based access

pragma solidity ^0.8.0;

contract RoleBasedContract {
    uint public value;
    address public creator;

    constructor(uint _value, address _creator) {
        value = _value;
        creator = _creator;
    }
}

contract RoleFactory {
    address public admin;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    function createRoleBasedContract(uint _value) public onlyAdmin returns (address) {
        return address(new RoleBasedContract(_value, msg.sender));
    }
}
