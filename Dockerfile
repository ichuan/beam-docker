FROM ubuntu:18.04

WORKDIR /opt
VOLUME /opt/coin
EXPOSE 10000

RUN apt-get update && apt-get install -y wget
RUN wget https://github.com/BeamMW/beam/releases/download/mainnet-release/linux-beam-node-1.0.3976.tar.gz -O - | tar xzf -

RUN rm -rf /var/lib/apt/lists/*

# peer from https://github.com/BeamMW/beam/releases https://www.beam.mw/downloads
ENTRYPOINT ["/opt/beam-node", "--storage", "/opt/coin/node.db", "--history_dir", "/opt/coin/history/", "--temp_dir", "/opt/coin/tmp/", "--port", "10000", "--peer", "ap-node04.mainnet.beam.mw:8100", "--peer", "ap-node03.mainnet.beam.mw:8100", "--peer", "ap-node02.mainnet.beam.mw:8100", "--peer", "ap-node01.mainnet.beam.mw:8100", "--peer", "us-node04.mainnet.beam.mw:8100", "--peer", "us-node03.mainnet.beam.mw:8100", "--peer", "us-node02.mainnet.beam.mw:8100", "--peer", "us-node01.mainnet.beam.mw:8100", "--peer", "eu-node04.mainnet.beam.mw:8100", "--peer", "eu-node03.mainnet.beam.mw:8100", "--peer", "eu-node02.mainnet.beam.mw:8100", "--peer", "eu-node01.mainnet.beam.mw:8100"]
