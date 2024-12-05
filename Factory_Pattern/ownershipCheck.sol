// SPDX-License-Identifier: MIT
// CC = 2
// Ownership check in factory pattern

pragma solidity ^0.8.0;

contract OwnedContract {
    uint public value;
    address public owner;

    constructor(uint _value) {
        value = _value;
        owner = msg.sender;
    }
}

contract OwnershipFactory {
    function createOwnedContract(uint _value) public returns (address) {
        OwnedContract newContract = new OwnedContract(_value);
        require(msg.sender == tx.origin, "Only EOA allowed");
        return address(newContract);
    }
}
