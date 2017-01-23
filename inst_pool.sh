#!/bin/bash
# Monero Pool Server install script

cd ~/

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
source ~/.nvm/nvm.sh
nvm install v6.9.2

sudo apt-get install redis-server

git clone https://github.com/Gingeropolous/cryptonote-xmr-pool.git ging_pool
cd ging_pool
git checkout clean

npm install

