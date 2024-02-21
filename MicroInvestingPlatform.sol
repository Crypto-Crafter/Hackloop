// SPDX-License-Identifier: MIT
// Specifies the license under which the code is released (MIT License)

pragma solidity ^0.8.10;
// Specifies the Solidity compiler version to be used

import "contracts/Ownable.sol";
// Imports the Ownable.sol file from the local contracts directory

import "contracts/access-control/FractionalShareToken.sol";
// Imports the FractionalShareToken.sol file from the local contracts/access-control directory

contract MicroInvestingPlatform is Ownable {
    // Declares a public variable to hold the FractionalShareToken contract instance
    FractionalShareToken public shareToken;

    // Mapping to store user's share balances for each token
    mapping(address => mapping(address => uint256)) public userShares;

    // Event emitted when an investor makes an investment
    event Invest(address indexed investor, uint256 amount);

    // Event emitted when an investor withdraws funds
    event Withdraw(address indexed investor, uint256 amount);

    // Constructor function to initialize the platform with a specific token address
    constructor(address tokenAddress) Ownable() {
        // Initialize the shareToken variable with the provided token address
        shareToken = FractionalShareToken(tokenAddress);
    }

    // Function for investors to make an investment
    function invest(uint256 amount) external {
        require(amount > 0, "Investment amount must be greater than 0");

        // Transfer ERC20 tokens from the investor to this contract
        shareToken.transferFrom(msg.sender, address(this), amount);

        // Update user's share balance for the token
        userShares[msg.sender][address(shareToken)] += amount;

        // Emit an Invest event
        emit Invest(msg.sender, amount);
    }

    // Function for investors to withdraw funds
    function withdraw(uint256 amount) external {
        require(amount > 0, "Withdrawal amount must be greater than 0");
        require(
            amount <= userShares[msg.sender][address(shareToken)],
            "Insufficient balance"
        );

        // Transfer ERC20 tokens from this contract back to the investor
        shareToken.transfer(msg.sender, amount);

        // Update user's share balance for the token
        userShares[msg.sender][address(shareToken)] -= amount;

        // Emit a Withdraw event
        emit Withdraw(msg.sender, amount);
    }

    // Function for the owner to withdraw funds from the platform
    function adminWithdraw(uint256 amount) external onlyOwner {
        // Owner can withdraw funds from the platform
        shareToken.transfer(owner, amount);
    }
}
