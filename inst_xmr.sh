#!/bin/bash
# Monero Core install script

now=$(date +"%m_%d_%Y")

cd /home/$USER/monero_files/
mkdir monero_$now
cd monero_$now

rm linux64*
wget https://downloads.getmonero.org/linux64
tar -xjvf linux64

# Copy binaries to /bin
#Restart service to use new binaries

sudo cp monerod /bin/
sudo cp monero-wallet-cli /bin/
sudo cp monero-wallet-rpc /bin/
sudo cp monero-blockchain-export /bin/ 
sudo cp monero-blockchain-import /bin/
sudo cp monero-utils-deserialize /bin/

echo "Monero Core Installed. Please press return to continue"
read goback

echo "MONERO" >> ~/.monerodo/install.log

cd ~/
