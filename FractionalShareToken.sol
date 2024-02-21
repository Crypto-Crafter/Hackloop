// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "contracts/Ownable.sol";

contract FractionalShareToken is ERC20, Ownable {
    constructor() ERC20("Fractional Share Token", "FST") Ownable() {
        _mint(msg.sender, 1000000 * 10**18); // Mint initial tokens for the owner
    }

    function mint(address account, uint256 amount) external onlyOwner {
        _mint(account, amount);
    }
}
