#!/bin/bash
# Monerodo Base Setup

sudo apt-get update && sudo apt-get upgrade -y

# Create folder structures

cd ~/
mkdir .monerodo
mkdir .monerodo/monero_files
mkdir .monerodo/wallets

# Install UBUNTU packages. Blessed are the package maintainers

sudo apt-get install -y \
openssh-server \
fail2ban \
git \
build-essential \
cmake \
pkg-config \
libboost-all-dev \
libevent-dev \
libunbound-dev \
screen \
apache2

# Lets make a website, eh? 

sudo mkdir /var/www/home
sudo mkdir /var/www/home/public_html
sudo mkdir /var/www/home/logs

sudo cp conf_files/index.html /var/www/home/public_html/
sudo cp conf_files/monerodo_logo.png /var/www/home/public_html/

sudo cp conf_files/home.conf /etc/apache2/sites-available/
sudo a2ensite /etc/apache2/sites-available/home.conf

### The below forces the system to use ipv6. Should make optional at some point. Probably requires a reboot.

sudo cat sysctl.add >> /etc/sysctl.conf
sudo sysctl -p
echo 'blacklist ipv6' | sudo tee -a '/etc/modprobe.d/blacklist.local' >/dev/null 

# Lets get the monerodo OS

cd ~/
git clone https://github.com/Gingeropolous/monerodo.git

echo "BASE" >> ~/.monerodo/install.log

echo "Monerodo Base System Installed. Press return to continue. You should probably reboot."
read goback

cd ~/
