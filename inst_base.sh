#!/bin/bash
# Monerodo Base Setup

sudo apt-get update && sudo apt-get upgrade -y

# Create folder structures

cd ~/
mkdir .monerodo
mkdir .monerodo/monero_files
mkdir .monerodo/wallets

sudo mkdir /opt/mos/
sudo mkdir /opt/mos/scripts

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

sudo ufw allow ssh
sudo ufw default deny

# Lets make a website, eh? 

sudo mkdir /var/www/home
sudo mkdir /var/www/home/public_html
sudo mkdir /var/www/home/logs

sudo cp conf_files/index.html /var/www/home/public_html/
sudo cp conf_files/monerodo_logo.png /var/www/home/public_html/

sudo cp conf_files/home.conf /etc/apache2/sites-available/
sudo a2ensite /etc/apache2/sites-available/home.conf

### The below forces the system to use ipv4. Should make optional at some point. Probably requires a reboot.

sudo cat sysctl.add >> /etc/sysctl.conf
sudo sysctl -p
echo 'blacklist ipv6' | sudo tee -a '/etc/modprobe.d/blacklist.local' >/dev/null 

# Lets get the monerodo OS

cd ~/
git clone https://github.com/Gingeropolous/monerodo.git


# Lets create a mos user so all the systemd scripts just work
# This should probably come earlier and then mos specific shit is installed as that user in the mos users home

echo "The Monerodo OS creates a new user called mos. Please prepare to give the new mos user a password.
echo "Press enter to continue"
read continue
clear

sudo adduser mos

sudo usermod -aG sudo mos

sudo mkdir /home/mos/.monerodo
sudo chown www-data /home/mos/.monerodo/

now=$(date +"%m_%d_%Y")

cd /home/$USER/.monerodo/monero_files
mv monero monero_$now
mkdir monero
cd monero

rm linux64*
wget https://downloads.getmonero.org/linux64
tar -xjvf linux64

# Copy binaries to /bin
#Restart service to use new binaries

cd monero*
sudo cp monerod /bin/
sudo cp monero-wallet-cli /bin/
sudo cp monero-wallet-rpc /bin/
sudo cp monero-blockchain-export /bin/ 
sudo cp monero-blockchain-import /bin/
sudo cp monero-utils-deserialize /bin/

echo "MONERO" >> ~/.monerodo/install.log

echo "BASE" >> ~/.monerodo/install.log

echo "Monerodo Base System Installed. Press return to continue. You should probably reboot."
read goback

cd ~/
