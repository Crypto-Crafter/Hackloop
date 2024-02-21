require("@nomicfoundation/hardhat-ethers");
require("@nomicfoundation/hardhat-toolbox");


/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity:{
  compilers: [
    {
      version: "0.8.10", // Add or update this line with the needed version
      settings: {
        // Other compiler settings if needed
      },
    },
  ],
  }
};
