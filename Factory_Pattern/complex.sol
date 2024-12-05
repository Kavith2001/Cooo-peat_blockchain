// SPDX-License-Identifier: MIT
// CC = 8

pragma solidity ^0.8.0;

contract ComplexContract {
    uint public value;
    address public creator;

    constructor(uint _value, address _creator) {
        value = _value;
        creator = _creator;
    }
}

contract HighCCFactory {
    address public admin;
    mapping(address => address) public userContracts;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    function createContract(uint _value) public {
        require(userContracts[msg.sender] == address(0), "Contract already created");
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
