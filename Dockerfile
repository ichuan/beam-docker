FROM ubuntu:18.04

WORKDIR /opt
VOLUME /opt/coin
EXPOSE 10000 10001

RUN apt-get update && apt-get install -y wget

# from https://builds.beam.mw/
RUN wget https://builds.beam.mw/mainnet/2019.01.21/Release/linux/beam-node-1.1.4202.tar.gz -O - | tar xzf -
RUN wget https://builds.beam.mw/mainnet/2019.01.21/Release/linux/wallet-api-1.1.4202.tar.gz -O - | tar xzf -
RUN wget https://builds.beam.mw/mainnet/2019.01.21/Release/linux/beam-wallet-cli-1.1.4202.tar.gz -O - | tar xzf -

RUN rm -rf /var/lib/apt/lists/*

COPY ./entrypoint.sh /opt/
RUN chmod +x /opt/entrypoint.sh

ENTRYPOINT ["/opt/entrypoint.sh"]
