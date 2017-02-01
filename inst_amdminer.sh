#!/bin/bash
#MONERODO AMD MINER INSTALL GROUP


#Menu
while true
do
	echo "================="
	echo "Monerodo OS Install Menu AMD Miner Section"
	echo "(AKA: Yes, i'm too lazy to make reboot logic)"
	echo "================="
	echo "[1] Do this"
	echo "[2] Then this"
	echo "[3] Then do this!"
	echo "[r] Return to main menu"
	echo -e "\n"
	echo -e "Enter your selection \c"
	read answer
	case "$answer" in
		0) ./inst_amd1.sh;;
		1) ./inst_amd2.sh;;
		2) ./inst_amd3.sh;;
		r) exit;;
	esac
	clear
done
