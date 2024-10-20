# eth-sf-2024

## Overview

Moses - custom curve hook that interpolates between a constant sum (curve), constant product (univ2), concentrated range (univ3), convex concentrated liquidity, and exponential-tailed liquidity with just one parameter ’n’.

<img width="919"  src=https://github.com/v-for-vasya/eth-sf-2024/blob/presentation/img/p_animation.mp4>
When n is between -1 and 0 it bulges the uni v3 concentrated liquidity position (concave).

p_convex2

When n is between 0 and 1 it dents a uni v3 concentrated liquidity position (convex). If we enter a volatile mode for the asset, we can jump either from A -> B or C -> C to B offering better price impact in both directions.

p_convex1

Alternatively, this curve is also great for a more capital efficient version of Univ2 as one increases n beyond 1.

p_vidfat.mp4

Consider two volatile assets - ETH and DOGE and observe how they diffuse across time:

p_3dvideo.mp4

Some assets can have thinner tails than others so we can use parameter n to specify the thickness:

P_fattail , p_thintail

To fit our data:

p_actualdata


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

### CurveTest.sol deployed and verified on Blockscout

https://unichain-sepolia.blockscout.com/address/0x82Fa8539F40F7317CEd662130d1F98eE1DE687a2?tab=contract

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
