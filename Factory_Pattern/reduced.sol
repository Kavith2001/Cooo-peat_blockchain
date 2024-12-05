// SPDX-License-Identifier: MIT
// CC = 4

pragma solidity ^0.8.0;

contract ReducedContract {
    uint public value;
    address public creator;

    constructor(uint _value, address _creator) {
        value = _value;
        creator = _creator;
    }
}

contract ReducedCCFactory {
    address public admin;
    mapping(address => address) public userContracts;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    function validateValue(uint _value) internal pure {
        require(_value >= 10 && _value <= 200, "Value out of range");
    }

    function createContract(uint _value) public {
        require(userContracts[msg.sender] == address(0), "Contract already created");
        validateValue(_value);
        userContracts[msg.sender] = address(new ReducedContract(_value, msg.sender));
    }
}

//Techniques Used:
// Decompose Logic into Functions - The logic is divided into functions to improve code readability and reusability.
// Avoided Nested Conditions - The code avoids nested conditions to keep the code simple and easy to understand.
// replace nested if-else with single reqired validation