#!/bin/bash
# Monero AMD install script 1


cd ~

echo "Whew! Now we can finally do the miner itself!"
echo "We're gonna switch to the mos user again"

sudo apt-get install libcurl4-openssl-dev pkg-config libtool libncurses5-dev autoconf

git clone https://github.com/genesismining/sgminer-gm.git

cd sgminer-gm

mkdir ~/Downloads/AMDSDL
unzip ~/Downloads/ADL_SDK_V*.zip -d ~/Downloads/AMDSDL

cp ~/Downloads/AMDSDL/include/*.h ADL_SDK/

git submodule init
git submodule update
autoreconf -i
CFLAGS="-O2 -Wall -march=native -std=gnu99" ./configure CPPFLAGS="-I/opt/AMDAPPSDK-3.0/include" LDFLAGS="-L/opt/amdgpu-pro/lib/x86_64-linux-gnu/"
make

cd ~/

sudo cp -r sgminer-gm/ /home/mos/
sudo cp conf_files/miner.conf /home/mos/.monerodo/
sudo cp scripts/amd_miner.sh /opt/mos/scripts/
sudo cp conf_files/MON_amd.service /etc/systemd/system/

echo "SGMINER" >> ~/.monerodo/install.log
