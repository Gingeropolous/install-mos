#!/bin/bash
# Monero AMD install script 1


cd ~

echo "All right! Lets get this SDK thing installed. Just do all the default options."

echo "Have you downloaded the files? (y/n)"
read fdload
case "$fdload" in
	*) echo "Well then not much good can come of anything on this page" ;;
	y)
cd ~/Downloads
tar -vxjf AMD-APP-SDKInstaller*.bz2
sudo ./AMD-APP-SDKInstaller*.sh
clear

echo "Now its time to reboot! Reboot now?"
read raboot
case "$raboot" in
	y) sudo reboot
	echo "Just wait for it to reboot"
	read wait ;;
	*) echo "OK then, I guess we'll just twiddle our thumbs" ;;
esac
;;
esac

clear
