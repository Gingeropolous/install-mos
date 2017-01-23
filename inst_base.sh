#!/bin/bash
# Monerodo Base Setup

sudo apt-get update && sudo apt-get upgrade -y

# Create folder structures

cd ~/
mkdir .monerodo
mkdir monero_files
mkdir wallets

sudo apt-get install \
openssh-server \
fail2ban \
git \
build-essential \
cmake \
pkg-config \
libboost-all-dev \
libevent-dev \
libunbound-dev \
screen


echo "Monerodo Base System Installed"
read goback

cd
