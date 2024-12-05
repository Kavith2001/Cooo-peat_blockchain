// SPDX-License-Identifier: MIT
// CC = 1
// Basic creation of a contract using factory pattern

pragma solidity ^0.8.0;

contract BasicContract {
    uint public value;

    constructor(uint _value) {
        value = _value;
    }
}

contract BasicFactory {
    function createBasicContract(uint _value) public returns (address) {
        return address(new BasicContract(_value));
    }
}
