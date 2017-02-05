#!/bin/bash
# Monero AMD install script 1


cd ~

echo "Whew! Now we can finally do the miner itself!"

sudo apt-get install libcurl4-openssl-dev pkg-config libtool libncurses5-dev autoconf

git clone https://github.com/genesismining/sgminer-gm.git

cd sgminer-gm

mkdir ~/Downloads/AMDSDL
unzip ~/Downloads/ADL_SDK_V*.zip -d ~/Downloads/AMDSDL
cp ~/Downloads/AMDSL/include/*.h ADL_SDK/

git submodule init
git submodule update
autoreconf -i
CFLAGS="-O2 -Wall -march=native -std=gnu99" ./configure
make

echo "SGMINER" >> ~/.monerodo/install.log


clear
