// SPDX-License-Identifier: MIT
// CC = 7
//Whitelist mechanism for controlled registration

pragma solidity ^0.8.0;

contract WhitelistRegistry {
    address public admin;
    mapping(address => bool) public whitelist;
    mapping(address => bool) public isRegistered;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not the admin");
        _;
    }

    function addToWhitelist(address _address) public onlyAdmin {
        whitelist[_address] = true;
    }

    function register(address _address) public {
        require(whitelist[_address], "Not whitelisted");
        isRegistered[_address] = true;
    }
}
