# beam-node-docker
Dockerfile for beam node

## Build

```
docker build -t beam-node .
```

## Run

```
mkdir -p data/{history,tmp}
docker run --rm -itd --name ibeam -p 0.0.0.0:10000:10000 -v `pwd`/data:/opt/coin beam-node
```

## Persist data

By using [CWSpear/local-persist](https://github.com/CWSpear/local-persist):

```
curl -fsSL https://raw.githubusercontent.com/CWSpear/local-persist/master/scripts/install.sh | sudo bash
docker volume create -d local-persist -o mountpoint=/data/beam-data --name=beam-data
```

## Using pre-built docker image

Using automated build image from <https://hub.docker.com/r/mixhq/beam-node/>:

```
docker run --rm -itd --name ibeam -p 0.0.0.0:10000:10000 -v beam-data:/opt/coin mixhq/beam-node
```
