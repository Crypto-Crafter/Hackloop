// SPDX-License-Identifier: MIT
// Specifies the license under which the code is released (MIT License)

pragma solidity ^0.8.10;
// Specifies the Solidity compiler version to be used

contract Ownable {
    // Declares a state variable to store the owner's address
    address public owner;

    // Modifier to restrict access to functions to only the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    // Constructor to set the deployer's address as the owner
    constructor() {
        owner = msg.sender;
    }
}
