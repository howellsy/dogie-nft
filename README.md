# 🐶 Dogie NFT - an IPFS hosted NFT

An IPFS hosted ERC721 NFT.

You can see this smart contract deployed [on Sepolia](https://sepolia.etherscan.io/address/0x480d37511041d907e2c1bf13e0f6d0e3f791bfd1) and an example of a minted Dogie NFT [on OpenSea](https://testnets.opensea.io/assets/sepolia/0x480d37511041d907e2C1bF13E0F6d0E3F791BFD1/0).

## ⚒️ Built with Foundry

This project is built with [Foundry](https://github.com/foundry-rs/foundry) a portable and modular toolkit for Ethereum application development, which is required to build and deploy the project.

## 🏗️ Getting started

Create a `.env` file with the following entries:

```
SEPOLIA_RPC_URL=<sepolia_rpc_url>
PRIVATE_KEY=<private_key>
ETHERSCAN_API_KEY=<etherscan_api_key>
```

Install project dependencies

```
make install
```

Deploy the smart contract on Anvil

```
make anvil
make deploy
```

Deploy the smart contract on Sepolia

```
make deploy ARGS="--network sepolia"
```

## 🧪 Running tests

To run against a local Anvil Ethereum node:

```
forge test
```

To run against a forked environment (e.g. a forked Sepolia testnet):

```
forge test --fork-url <sepolia_rpc_url>
```
