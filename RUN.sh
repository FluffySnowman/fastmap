echo "UPDATING FASTMAP................................................." | randtype -t 5,12000 | lolcat
git pull
echo "UPDATE COMPLETE :)..............................................." | randtype -t 5,12000 | lolcat
echo "UPDATING PACKAGE LIST............................................" | randtype -t 5,12000 | lolcat
if [ -f /usr/bin/apt ]; then
    echo "Debian based system detected"
    bash install/install_debian_apt.sh
elif [ -f /usr/bin/yum ]; then
    echo "Redhat based system detected"
    bash install/install_redhat_yum.sh
elif [ -f /usr/bin/pacman ]; then
    echo "Arch based system detected"
    bash install/install_arch_pacman.sh
else
    echo "Unknown system"
    exit 1
fi
echo "All Packages upgraded :)" | randtype -t 5,12000 | lolcat
read -p "Press Enter to start fastmap" null
echo "RUNNING FASTMAP" | randtype -t 5,12000 | lolcat
bash fastmap.sh
