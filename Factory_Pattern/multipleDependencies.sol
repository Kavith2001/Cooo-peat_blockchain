// SPDX-License-Identifier: MIT
// CC = 7
// Factory pattern with multiple dependencies

pragma solidity ^0.8.0;

contract DependentContract {
    uint public value;
    address public creator;

    constructor(uint _value, address _creator) {
        value = _value;
        creator = _creator;
    }
}

contract DependencyFactory {
    mapping(address => address) public userContracts;
    address public admin;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    function createDependentContract(uint _value) public {
        require(userContracts[msg.sender] == address(0), "Contract already created");
        userContracts[msg.sender] = address(new DependentContract(_value, msg.sender));
    }

    function isAdmin() public view returns (bool) {
        return msg.sender == admin;
    }
}
