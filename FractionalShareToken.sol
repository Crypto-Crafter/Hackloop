// SPDX-License-Identifier: MIT
// Specifies the license under which the code is released (MIT License)

pragma solidity ^0.8.10;
// Specifies the Solidity compiler version to be used

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// Imports the ERC20.sol file from the OpenZeppelin library

import "contracts/Ownable.sol";
// Imports the Ownable.sol file from the local contracts directory

contract FractionalShareToken is ERC20, Ownable {
    // Constructor function to initialize the token with a name and symbol
    constructor() ERC20("Fractional Share Token", "FST") Ownable() {
        // Mints initial tokens (1,000,000 FST) to the contract deployer
        _mint(msg.sender, 1000000 * 10**18); // 18 decimals for precision
    }

    // Function to mint additional tokens, accessible only by the owner
    function mint(address account, uint256 amount) external onlyOwner {
        _mint(account, amount); // Mints 'amount' of tokens to 'account'
    }
}
