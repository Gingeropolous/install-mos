#!/bin/bash
# Monero AMD install script 1


cd ~

echo "Whew! Now we can finally do the miner itself!"

sudo apt-get install libcurl4-openssl-dev pkg-config libtool libncurses5-dev autoconf

git clone https://github.com/genesismining/sgminer-gm.git

cd sgminer-gm

git submodule init
git submodule update
autoreconf -i
CFLAGS="-O2 -Wall -march=native -std=gnu99" ./configure
make

echo "SGMINER" >> ~/.monerodo/install.log


clear
