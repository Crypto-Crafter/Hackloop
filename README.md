#Team CryptoCrafters<br>
-Dinesh Acharya<br>
-Namratha M<br>
-Akhil Manoj<br>
-Raghavendra S Shettigar<br>
Hello everyone, we are team CryptoCrafters. We have been working on building a Blockchain based automatic market makers for decentralised stock exchange facilitating microinvesting with fractional shares.<br>
#What is the problem?<br>
The speed of order execution in the stock market has become exponentially faster when compared to the early days of electronic market. Though the transaction speed hasincreased, the underlying architecture 
or models behind the markets have remained the same. The bigger players, such as financial institutions, have an advantage over smaller players because of factors such as information asymmetry and access to
better infrastructure, which give them an advantage in terms of the speed of execution. This makes the centralized stock market an uneven playing field.<br>
#Our Solution<br>
Our project with the help of Blockchain Technology overcomes the limitations of centralized financial markets, particularly the disadvantage faced by non-institutional or small traders due to information asymmetry
and better infrastructure access by financial institutions.<br>
#Tech stack and Tools used<br>
We have built Ethereum smart contracts using Solidity and deployed it on Hardhat Network
We have also used ERC20 Tokens from OpenZeppelin library<br>
Hardhat is a local Ethereum network which is specifically designed for development<br>
#Ownable Contract<br>
This Solidity smart contract defines a basic implementation of the Ownable pattern, commonly used in Ethereum smart contracts to restrict access to certain functions or actions to only the owner of the contract.
Overall, this contract allows to define functions in derived contracts.
#FractionalShareToken Contract
This Solidity smart contract inherits from two other contracts: ERC20 and Ownable.The ERC20 contract is a standard implementation of the ERC20 token standard for fungible tokens on the Ethereum blockchain.
The main function of this contract is the The mint function allows the owner of the contract to mint additional tokens. It takes two parameters: account, the address to which the tokens will be minted, and amount, the number of tokens to mint. This function is restricted to be called only by the owner of the contract using the onlyOwner modifier inherited from the Ownable contract. Inside the function, it calls the _mint function inherited from ERC20 to mint the specified amount of tokens and assign them to the specified account.
#MicroInvestingPlatform
This Solidity smart conract facilitates a platform for micro-investing that allows users to invest in a fractional share token and withdraw their investments
We have mainly two functions in this contract.
The invest function allows users to invest in the platform by transferring ERC20 tokens to this contract. It takes an amount parameter, representing the number of tokens to invest. It first checks that the investment amount is greater than 0, then transfers tokens from the sender to the platform contract using the transferFrom function of the shareToken. It then updates the user's share balance in the userShares mapping and emits an Invest event.
The withdraw function allows users to withdraw their investments from the platform. It takes an amount parameter, representing the number of tokens to withdraw. It first checks that the withdrawal amount is greater than 0 and that the user has sufficient balance.
Then, it transfers tokens back to the investor using the transfer function of the shareToken and updates the user's share balance in the userShares mapping. It emits a Withdraw event.
#Scope of Improvement
1.Extend the platform for a production level implementation
2.Integrate the blockchain with a JavaScript frontend usinf Web3.js for user-friendly interaction


