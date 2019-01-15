#!/usr/bin/env bash

set -e

if test $# -eq 0; then
  # generate wallet db if needed
  [ ! -f /opt/coin/wallet/wallet.db ] && {
    echo "Generating wallet at /opt/coin/wallet/init.txt ..."
    /opt/beam-wallet --wallet_path /opt/coin/wallet/wallet.db \
      --pass word \
      --command init > /opt/coin/wallet/init.txt
  }
  # start node
  ## peer from https://github.com/BeamMW/beam/releases https://www.beam.mw/downloads
  /opt/beam-node --storage /opt/coin/node.db \
    --history_dir /opt/coin/history/ \
    --temp_dir /opt/coin/tmp/ \
    --port 10000 \
    --peer ap-node04.mainnet.beam.mw:8100 \
    --peer ap-node03.mainnet.beam.mw:8100 \
    --peer ap-node02.mainnet.beam.mw:8100 \
    --peer ap-node01.mainnet.beam.mw:8100 \
    --peer us-node04.mainnet.beam.mw:8100 \
    --peer us-node03.mainnet.beam.mw:8100 \
    --peer us-node02.mainnet.beam.mw:8100 \
    --peer us-node01.mainnet.beam.mw:8100 \
    --peer eu-node04.mainnet.beam.mw:8100 \
    --peer eu-node03.mainnet.beam.mw:8100 \
    --peer eu-node02.mainnet.beam.mw:8100 \
    --peer eu-node01.mainnet.beam.mw:8100 2>&1 &
  # wallet (for receiving)
  /opt/beam-wallet --wallet_path /opt/coin/wallet/wallet.db --pass word \
    --command listen -n 127.0.0.1:10000 2>&1 &
  # wallet api
  exec /opt/wallet-api --port 10001 \
    --node_addr 127.0.0.1:10000 \
    --wallet_path /opt/coin/wallet/wallet.db \
    --pass word
else
  exec $@
fi
