const main = async () => {
    const nftContractFactory = await hre.ethers.getContractFactory('myepicnft');
    const nftContract = await nftContractFactory.deploy();
    await nftContract.deployed();
    console.log("Contract depolyed to :", nftContract.address);

    // call the function
    let txn = await nftContract.makeAnEpicNFT();
    //wait for it to be mined
    await txn.wait();
    //make another nft 4 fun
    txn = await nftContract.makeAnEpicNFT();
    await txn.wait();
}

const runMain = async () =>{
    try{
        await main();
        process.exit(0);
    }catch (error){
        console.log(error);
        process.exit(1);
    }
}

runMain();