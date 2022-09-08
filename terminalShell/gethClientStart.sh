cd ethereum/execution 
geth --goerli --http --http.api eth,net,web3,engine,admin --datadir . --authrpc.jwtsecret ../consensus/jwt.hex
