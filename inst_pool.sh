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

npm update

sudo mkdir /var/www/pool
sudo mkdir /var/www/pool/logs
sudo cp -r website-example/ /var/www/pool/public_html

echo "POOL" >> ~/.monerodo/install.log

echo "Your pool server has been installed. For further configurations you'll need to use the Monerodo OS"
echo "Its best to reboot the Monerodo now. The pool software doesn't work unless you reboot it."
echo "Do you want to reboot? y/n"
read rabbot
case "$rabbot" in
	y) sudo reboot
	echo "Just wait for it to reboot. Buh bye";;
	*) echo "OK, well, your pool won't work!" ;;
esac


