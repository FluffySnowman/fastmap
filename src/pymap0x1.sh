function pymap() {
		echo "================================================================" | lolcat
		read -p "Enter gateway to scan for>>> " pymap_0x1

		sudo python3 pymap.py -t $pymap_0x1 > online_hosts_pymap.txt
		echo "Calculating total amount of online hosts..." | randtype -t 5,12000 | lolcat
		cat online_hosts_pymap.txt
		cat online_hosts_pymap.txt | grep -v -e "-----------------------------------" -e "IP Address" -e "MAC Address" | wc -l > total_hosts_online_pymap.txt
		cat total_hosts_online_pymap.txt && echo " hosts online"

		echo "================================================================" | lolcat
}   