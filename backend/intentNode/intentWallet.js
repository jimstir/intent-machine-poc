const ethers = require('ethers');

const url = 'https://sepolia.base.org';
const provider = new ethers.providers.JsonRpcProvider(url);

var connectWallet;
var address;
// Get wallet address
function createWallet(){
    const wallet = ethers.Wallet.createRandom();
    connectWallet = wallet.connect(provider);

}

function getAddress(){
    address = connectWallet.address;
    console.log("Wallet address:", address);
}

// 