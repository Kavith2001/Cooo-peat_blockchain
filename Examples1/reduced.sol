// SPDX-License-Identifier: MIT
//cc - 5

pragma solidity ^0.8.0;

contract ProductFactorySimple {
    address public owner;
    mapping(address => bool) public admins;

    struct Product {
        string name;
        uint8 state; // 0: Created, 1: Shipped, 2: Delivered
    }

    mapping(address => Product) public products;

    event ProductCreated(address indexed productAddress, string name);
    event StateUpdated(address indexed productAddress, uint8 newState);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can execute");
        _;
    }

    constructor() {
        owner = msg.sender;
        admins[owner] = true;
    }

    function createProduct(string memory _name, address _productAddress) external {
        require(bytes(_name).length > 0, "Name cannot be empty");
        products[_productAddress] = Product(_name, 0);
        emit ProductCreated(_productAddress, _name);
    }

    function updateState(address _productAddress, uint8 _newState) external {
        require(_newState > products[_productAddress].state, "Invalid transition");
        products[_productAddress].state = _newState;
        emit StateUpdated(_productAddress, _newState);
    }
}
