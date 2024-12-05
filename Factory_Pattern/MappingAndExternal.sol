// SPDX-License-Identifier: MIT
// CC = 5
// Factory pattern with mapping and external contract creation

pragma solidity ^0.8.0;

contract ExternalContract {
    uint public value;

    constructor(uint _value) {
        value = _value;
    }
}

contract MappingFactory {
    mapping(address => address) public userContracts;

    function createExternalContract(uint _value) public {
        require(userContracts[msg.sender] == address(0), "Contract already created");
        userContracts[msg.sender] = address(new ExternalContract(_value));
    }

    function getUserContract() public view returns (address) {
        return userContracts[msg.sender];
    }
}
