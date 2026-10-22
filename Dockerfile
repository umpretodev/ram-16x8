FROM ubuntu:24.04
RUN apt-get update \
 && apt-get install -y --no-install-recommends ghdl \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /work
