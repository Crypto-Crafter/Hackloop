// scripts/deploy.js
async function main () {
  // We get the contract to deploy
  const Box = await ethers.getContractFactory('Ownable');
  console.log('Deploying Ownable...');
  const box = await Box.deploy();
  await box.waitForDeployment();
  console.log('Ownable deployed to:',await box.getAddress());
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
