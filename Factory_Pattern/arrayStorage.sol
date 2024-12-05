// SPDX-License-Identifier: MIT
// CC = 3
// Factory pattern with array storage

pragma solidity ^0.8.0;

contract StorableContract {
    uint public value;

    constructor(uint _value) {
        value = _value;
    }
}

contract StorageFactory {
    StorableContract[] public contracts;

    function createStorableContract(uint _value) public {
        contracts.push(new StorableContract(_value));
    }

    function getContract(uint index) public view returns (address) {
        return address(contracts[index]);
    }
}
