// SPDX-License-Identifier: MIT
//CC - 7

pragma solidity ^0.8.0;

contract ProductFactoryComplex {
    address public owner;
    mapping(address => bool) public admins;
    mapping(address => bool) public productsRegistry;

    struct Product {
        string name;
        uint256 state; // 0: Created, 1: Shipped, 2: Delivered
        address owner;
    }

    mapping(address => Product) public products;

    event ProductCreated(address indexed productAddress, string name);
    event StateUpdated(address indexed productAddress, uint256 newState);

    modifier onlyAdmin() {
        require(admins[msg.sender], "Not an admin");
        _;
    }

    modifier onlyOwnerOrAdmin() {
        require(msg.sender == owner || admins[msg.sender], "Not authorized");
        _;
    }

    constructor() {
        owner = msg.sender;
        admins[owner] = true;
    }

    function addAdmin(address _admin) external onlyOwnerOrAdmin {
        admins[_admin] = true;
    }

    function createProduct(string memory _name, address _productAddress) external onlyAdmin {
        require(!productsRegistry[_productAddress], "Product already exists");
        products[_productAddress] = Product(_name, 0, msg.sender);
        productsRegistry[_productAddress] = true;
        emit ProductCreated(_productAddress, _name);
    }

    function updateState(address _productAddress, uint256 _newState) external onlyAdmin {
        require(productsRegistry[_productAddress], "Product not registered");
        require(_newState > products[_productAddress].state, "Invalid state transition");
        products[_productAddress].state = _newState;
        emit StateUpdated(_productAddress, _newState);
    }
}
