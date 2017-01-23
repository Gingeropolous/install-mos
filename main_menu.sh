#!/bin/bash
#MONERODO operating script to load upon login

#make username variable global
export u="$USER" #should be deprecated by now, all instances replaced with bob
export current_ip="$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')"
export help="Type 'back' to return to previous menu"
# export FILEDIR=$(grep -n 'filedir' /home/bob/monerodo/conf_files/monerodo.index |cut -d"=" -f2)
export VERSION=$(grep -n 'version' /home/bob/monerodo/conf_files/monerodo.index |cut -d"=" -f2)

#### Duh

cd /home/bob/install-mos/


# ------------------------ END OF HEADER -------------------------

#Menu
while true
do
	echo "================="
	echo "Monerodo OS Install Menu. Version $VERSION"
	echo "================="
	echo "[0] Monerodo base system"
	echo "[1] Monero Core"
	echo "[2] Pool Server"
	echo "[3] Block Explorer Server"
	echo "[4] MiniNodo wallet server"
	echo "[5] nVidia mining system"
	echo "[6] AMD mining system"
	echo "[q] Quit to the terminal"
	echo -e "\n"
	echo -e "Enter your selection \c"
	read answer
	case "$answer" in
		0) ./inst_base.sh;;
		1) ./inst_xmr.sh;;
		2) ./inst_pool.sh;;
		3) ./inst_explorer.sh;;
		4) ./inst_mininodo.sh;;
		5) ./inst_nvidia.sh;;
		6) ./inst_amd.sh;;
		q) exit ;;
		fork)./upd_2017FORK1.sh;;
	esac
	clear
done
