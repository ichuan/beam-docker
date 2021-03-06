FROM ubuntu:18.04

WORKDIR /opt
VOLUME /opt/coin
EXPOSE 10000 10001

RUN apt-get update && apt-get install -y wget

RUN wget https://github.com/BeamMW/beam/releases/download/beam-3.1.5765/linux-beam-node-3.1.5765.tar.gz -O - | tar xzf -
RUN wget https://github.com/BeamMW/beam/releases/download/beam-3.1.5765/linux-wallet-api-3.1.5765.tar.gz -O - | tar xzf -
RUN wget https://github.com/BeamMW/beam/releases/download/beam-3.1.5765/linux-beam-wallet-cli-3.1.5765.tar.gz -O - | tar xzf -

RUN rm -rf /var/lib/apt/lists/*

COPY ./entrypoint.sh /opt/
RUN chmod +x /opt/entrypoint.sh

ENTRYPOINT ["/opt/entrypoint.sh"]
