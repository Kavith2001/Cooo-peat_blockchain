// SPDX-License-Identifier: MIT
// CC = 1
//Single function with no conditions

pragma solidity ^0.8.0;

contract BasicRegistry {
    address public registered;

    function register(address _address) public {
        registered = _address;
    }
}
