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

## Run clients at the same time in different terminals

Terminal 1 (Prysm): 

    cd ethereum/consensus/prysm
    ./prysm.sh beacon-chain --execution-endpoint=http://localhost:8551/ --prater --jwt-secret=../jwt.hex --genesis-state=genesis.ssz 


Terminal 2 (Geth): 

    cd ethereum/execution 
    geth --goerli --http --http.api eth,web3,net,txpool --ws --ws.api eth,web3,net,txpool --authrpc.jwtsecret ../consensus/jwt.hex


## Sync status

To check node status sync:

Prysm is done syncing when: "is_syncing:false" 

Geth is done syncing when: "is_optimistic:false" 

    curl http://localhost:3500/eth/v1/node/syncing | jq 

Prysm sync monitor: https://prater.beaconcha.in/blocks

Geth sync monitor: https://goerli.etherscan.io/blocks 

## Using RPC endpoints

HTTP

    http://localhost:8545
    
WS

    ws://localhost:8546
    
## Geth IPC Commands

Start IPC server

    geth attach http://localhost:8545 
    
Check the chainId: 

    eth.chainId()

Check sync status:

    eth.syncing

Check sync status based on blocks left to sync:

    eth.syncing.highestBlock - eth.syncing.currentBlock

## Client diversity 

Running different CL and EL also helps decentralize the network.

https://clientdiversity.org/

Prysm shows how to setup other clients easily by selecting which clients you want to use:

https://docs.prylabs.network/docs/install/install-with-script

## :mountain: This guide turns a weird mountain man fantasy into reality :mountain: 

<img src="https://github.com/WeiBridged/NodeGoerliMerge/blob/main/images/nodeTweet.jpg" alt="tweet"/>

Tweet: https://twitter.com/vitalikbuterin/status/873177382164848641

