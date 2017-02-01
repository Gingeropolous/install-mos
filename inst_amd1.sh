#!/bin/bash
# Monero AMD install script 1


cd ~

echo "This script installs the latest version of Sgminer-GM"
echo "This script depends on you having downloaded the AMD driver and SDK package thing."
echo "I don't provide scripted downloads or the files because they get updated and links get broken."
echo ""
echo "Be sure to download them into your /home/$USER/Downloads folder!!"
echo ""
echo "Please download the driver from here:"
echo "http://support.amd.com/en-us/kb-articles/Pages/AMD-Radeon-GPU-PRO-Linux-Beta-Driver%E2%80%93Release-Notes.aspx"
echo ""
echo "And please download the SDK package from here:"
echo "http://developer.amd.com/tools-and-sdks/opencl-zone/amd-accelerated-parallel-processing-app-sdk/"
echo ""
echo "And then the ADL library from here:"
echo "http://developer.amd.com/tools-and-sdks/graphics-development/display-library-adl-sdk/"
echo ""
echo "Please install these components as described on the AMD site, or this script can attempt to do it for you."

echo "Have you downloaded the files? (y/n)"
read fdload
case "$fdload" in
	*) echo "Well then not much good can come of anything on this page" ;;
	y)
echo "Do you want this script to attempt to install? (y/n)"
read scrinstall
case "$scrinstall" in
	*) echo "Well good on yah for doing it yourself!" ;;
	y)
cd ~/Downloads
tar xf amdgpu-pro*.xz
cd amdgpu-pro*
sudo ./amdgpu-pro-install -y 

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
;;
esac

clear
