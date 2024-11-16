import { Coinbase, Wallet } from "@coinbase/coinbase-sdk";
import axios from "axios";
let coinbase = Coinbase.configureFromJson({ filePath: '~/Downloads/cdp_api_key.json' });

var listWallet;
var defaultWallet;
let wallet = await Wallet.create();
console.log(`Wallet successfully created: `, wallet.toString());

// get current default wallet id
function getWallet(walletID){
    let walFetch = Wallet.fetch(walletID);
    wallet = walFetch;
}

// Wallets come with a single default Address
async function getAddress() {
    let address = await wallet.getDefaultAddress();
    defaultWallet = address.id
    console.log(`Default address for the wallet: `, address.toString());
    console.log("Displaying the id which I think is the wallet address", defaultWallet);
}

// Get wallet id
async function walletID(){
    let fetchedData = await fetch(wallet.getId());
    console.log(fetchedData);
    walletId = fetchData;
}

// Create staking pool and intent service

// Mint token and send to user

// Use faucet to get ETH