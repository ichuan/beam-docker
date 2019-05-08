FROM ubuntu:18.04

WORKDIR /opt
VOLUME /opt/coin
EXPOSE 10000 10001

RUN apt-get update && apt-get install -y wget

RUN wget https://github.com/BeamMW/beam/releases/download/bright_boson_2.0/linux-beam-node-2.0.4739.tar.gz -O - | tar xzf -
RUN wget https://github.com/BeamMW/beam/releases/download/api_2.0.4739/linux-wallet-api-2.0.4739.tar.gz -O - | tar xzf -
RUN wget https://github.com/BeamMW/beam/releases/download/bright_boson_2.0/linux-beam-wallet-cli-2.0.4739.tar.gz -O - | tar xzf -

RUN rm -rf /var/lib/apt/lists/*

COPY ./entrypoint.sh /opt/
RUN chmod +x /opt/entrypoint.sh

ENTRYPOINT ["/opt/entrypoint.sh"]
