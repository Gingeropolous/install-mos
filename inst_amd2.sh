#!/bin/bash
# Monero AMD install script 1


cd ~

echo "All right! Lets get this SDK and SDL libraries installed. Just do all the default options."

echo "Have you downloaded the files? (y/n)"
read fdload
case "$fdload" in
	y)
cd ~/Downloads
tar -vxjf AMD-APP-SDKInstaller*.bz2
sudo ./AMD-APP-SDK*.sh
clear
echo "Now its time to reboot! Press enter to continue"
read goback
;;
esac

