# beam-docker
Dockerfile for beam node and beam wallet

- We expose beam-node at port 10000, and wallet-api at 10001
- After initial run
  - Generated `seed_phrase` and first address is at `data/wallet/init.txt`
  - Encrypted wallet is at `data/wallet/wallet.db`
  - Wallet pass is `word`

## Build

```
docker build -t beam .
```

## Run

```
mkdir data
docker run --rm -itd --name ibeam -p 10000:10000 -p 10001:10001 -v `pwd`/data:/opt/coin beam
```

## Using pre-built docker image

Using automated build image from <https://hub.docker.com/r/mixhq/beam/>:

```
docker run --rm -itd --name ibeam -p 10000:10000 -p 10001:10001 -v `pwd`/data:/opt/coin mixhq/beam
```
