## Install Merge Node Clients Execution Layer for Consensus Layer

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
    geth --goerli --http --http.api eth,net,web3,engine,admin --datadir . --authrpc.jwtsecret ../consensus/jwt.hex


## Sync status

To check node status sync (false means is finished syncing): 

    curl http://localhost:3500/eth/v1/node/syncing | jq 

Prysm sync monitor: https://prater.beaconcha.in/blocks

Geth sync monitor: https://goerli.etherscan.io/blocks 

## Using RPC endpoints

HTTP

    http://localhost:8545/

## Client diversity

https://clientdiversity.org/
