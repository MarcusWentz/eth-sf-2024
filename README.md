# eth-sf-2024

## Overview

Custom curve using prb-math.

## Uniswap V4 Hook Template 

https://github.com/uniswapfoundation/v4-template

## Unichain

### Metamask Chainlist

https://chainlist.org/?search=unichain&testnets=true

### Bridge From Sepolia 

https://superbridge.app/unichain-sepolia

### Block Explorer

#### Blockscout

https://unichain-sepolia.blockscout.com/

#### Etherscan

https://sepolia.uniscan.xyz/

## Foundry

### Install Contract Libraries

#### v4-core
```shell
forge install https://github.com/Uniswap/v4-core --no-commit
```
#### v4-periphery
```shell
forge install https://github.com/Uniswap/v4-periphery --no-commit
```
#### prb-math
```shell
forge install PaulRBerg/prb-math@release-v4 --no-commit
```

### Deploy and Verify Blockscout
```shell
forge create src/CurveTest.sol:CurveTest \
--private-key $devTestnetPrivateKey \
--rpc-url https://sepolia.unichain.org \
--verify \
--verifier blockscout \
--verifier-url https://unichain-sepolia.blockscout.com/api/
```

### Verify Blockscout Contract Already Deployed
```shell
forge verify-contract \
--rpc-url https://sepolia.unichain.org \
<contract_address> \
src/CurveTest.sol:CurveTest \
--verifier blockscout \
--verifier-url https://unichain-sepolia.blockscout.com/api/
```

### Blockscout Foundry Documentation

https://docs.blockscout.com/devs/verification/foundry-verification

### Run a Hook Test Script With Unichain
```shell
forge script script/00_Counter.s.sol:CounterScript \
--private-key $devTestnetPrivateKey \
--rpc-url https://sepolia.unichain.org 
```