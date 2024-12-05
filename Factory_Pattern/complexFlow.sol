// SPDX-License-Identifier: MIT
// CC = 8
// Factory pattern with complex flow

pragma solidity ^0.8.0;

contract ComplexContract {
    uint public value;
    address public creator;

    constructor(uint _value, address _creator) {
        value = _value;
        creator = _creator;
    }
}

contract ComplexFactory {
    mapping(address => address) public userContracts;
    address public admin;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    function createComplexContract(uint _value) public {
        if (_value > 200) {
            revert("Value too high");
        } else if (_value < 10) {
            revert("Value too low");
        } else {
            userContracts[msg.sender] = address(new ComplexContract(_value, msg.sender));
        }
    }

    function getAdmin() public view returns (address) {
        if (msg.sender == admin) {
            return admin;
        } else {
            return address(0);
        }
    }
}
