## :question: Why should I run a node :question:

Running your own node increases:

-read and write speed to a blockchain

-decentralization with more network endpoints for users to access

## 🐻‍❄️ + 🐻 = 🐼 Merge Node Client Communication 🐼 = 🐻 + 🐻‍❄️ 

Post merge blockchains (like Goerli) require 2 clients to be synced together to run a node to access the network:

-Consensus Layer (Which blocks and transactions should I validate?)

-Execution Layer (How do I execute EVM logic and build transactions?)

<img src="https://github.com/WeiBridged/NodeGoerliMerge/blob/main/images/mergeClients2.png" alt="clients"/>

## Install Merge Node Clients for Consensus Layer and Execution Layer

### Prysm (CL)

https://docs.prylabs.network/docs/install/install-with-script

### Geth (EL) 

https://www.quicknode.com/guides/infrastructure/how-to-install-and-run-a-geth-node

## Run RPC node clients at the same time in different terminals

Terminal 1 (Prysm): 

```shell
cd ethereum/consensus/prysm
./prysm.sh beacon-chain --prater --execution-endpoint=http://localhost:8551 --jwt-secret=jwt.hex
```

Terminal 2 (Geth): 

⚠️ Make sure you downloaded the genesis.ssz file into your prysm folder! ⚠️

```shell
cd ethereum/execution 
geth --goerli --http --http.api eth,web3,net,txpool --ws --ws.api eth,web3,net,txpool --authrpc.jwtsecret ../consensus/prysm/jwt.hex
```

## Sync status

To check node status sync:

Prysm is done syncing when: "is_syncing:false" 

Geth is done syncing when: "is_optimistic:false" 

```shell
curl http://localhost:3500/eth/v1/node/syncing | jq 
```
    
Prysm sync monitor: https://prater.beaconcha.in/blocks

Geth sync monitor: https://goerli.etherscan.io/blocks 

## Using RPC endpoints

HTTP

```
http://localhost:8545
```

WS

```
ws://localhost:8546
```

## Geth IPC Commands

Start IPC server

```shell
geth attach http://localhost:8545 
``` 
   
Check the chainId: 

```javascript
eth.chainId()
```

Check sync status:

```javascript
eth.syncing
```

Check sync status based on blocks left to sync:

```javascript
eth.syncing.highestBlock - eth.syncing.currentBlock
```

## Run a Validator

Create and deposit validator key data:

🐼 You must be running the EL (Geth) and CL (Prysm) RPC node clients as shown above to have your validator synced. 🐼

🔐 Do this with your internet off to hide your validator seed phrase written down on paper. 🔐 

💲 Make sure you have 32 ETH to deposit. 💲

🔎 Check the address you are depositing to with your validator seed phrase written down with the correct smart contract transaction calldata. 🔎

🚨 Sync the CL and EL RPC nodes before you make the deposit to avoid potentially losing Ether being offline once it is received. 🚨 

☎️ Use Infura or any other node provider to connect to Prysm while Geth syncs if you sent Ether before syncing by accident. ☎️ 

🛰️ If even Prysm hasn't synced yet, consider using a simple 3rd party validator service like Allnodes on Goerli (Allnodes appears to not ask for your validator seed phrase to prevent stealing your staked 32 ETH).  🛰️

https://goerli.launchpad.ethereum.org/en/

<img src="https://github.com/WeiBridged/NodeGoerliMerge/blob/main/images/validator.png" alt="validator"/>

To start validator once you follow all of these steps:

https://docs.prylabs.network/docs/install/install-with-script#step-5-run-a-validator-using-prysm

run:

```shell
cd ethereum/consensus/prysm
./prysm.sh validator --wallet-dir=/home/<USER>/ethereum/consensus  --prater
```

📬 Guide to withdraw validator stake: 📬 

https://launchpad.ethereum.org/en/withdrawals

## Client diversity 

Running different CL and EL also helps decentralize the network.

https://clientdiversity.org/

Prysm shows how to setup other clients easily by selecting which clients you want to use:

https://docs.prylabs.network/docs/install/install-with-script

## :mountain: This guide turns a weird mountain man fantasy into reality :mountain: 

<img src="https://github.com/WeiBridged/NodeGoerliMerge/blob/main/images/nodeTweet.jpg" alt="tweet"/>

Tweet: https://twitter.com/vitalikbuterin/status/873177382164848641

