// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "contracts/Ownable.sol";
import "contracts/access-control/FractionalShareToken.sol";

contract MicroInvestingPlatform is Ownable {
    FractionalShareToken public shareToken;

    mapping(address => mapping(address => uint256)) public userShares;

    event Invest(address indexed investor, uint256 amount);
    event Withdraw(address indexed investor, uint256 amount);

    constructor(address tokenAddress) Ownable() {
        shareToken = FractionalShareToken(tokenAddress);
    }

    function invest(uint256 amount) external {
        require(amount > 0, "Investment amount must be greater than 0");

        // Transfer ERC20 tokens to this contract
        shareToken.transferFrom(msg.sender, address(this), amount);

        // Update user's share balance
        userShares[msg.sender][address(shareToken)] += amount;

        emit Invest(msg.sender, amount);
    }

    function withdraw(uint256 amount) external {
        require(amount > 0, "Withdrawal amount must be greater than 0");
        require(
            amount <= userShares[msg.sender][address(shareToken)],
            "Insufficient balance"
        );

        // Transfer ERC20 tokens back to the investor
        shareToken.transfer(msg.sender, amount);

        // Update user's share balance
        userShares[msg.sender][address(shareToken)] -= amount;

        emit Withdraw(msg.sender, amount);
    }

    function adminWithdraw(uint256 amount) external onlyOwner {
        // Owner can withdraw funds from the platform
        shareToken.transfer(owner, amount);
    }
}
