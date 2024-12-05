// SPDX-License-Identifier: MIT
// CC = 4
// Conditional check in factory pattern

pragma solidity ^0.8.0;

contract ConditionalContract {
    uint public value;

    constructor(uint _value) {
        value = _value;
    }
}

contract ConditionalFactory {
    address[] public contracts;

    function createConditionalContract(uint _value) public {
        if (_value > 100) {
            revert("Value too high");
        }
        contracts.push(address(new ConditionalContract(_value)));
    }

    function getContractCount() public view returns (uint) {
        return contracts.length;
    }
}

