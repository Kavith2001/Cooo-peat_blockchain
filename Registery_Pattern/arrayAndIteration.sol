// SPDX-License-Identifier: MIT
// CC = 6
//Added array storage with iteration logic

pragma solidity ^0.8.0;

contract ArrayRegistry {
    address public admin;
    address[] public registeredAddresses;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not the admin");
        _;
    }

    function register(address _address) public onlyAdmin {
        registeredAddresses.push(_address);
    }

    function getAllRegistered() public view returns (address[] memory) {
        return registeredAddresses;
    }
}
