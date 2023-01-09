function zmap() {
    echo "================================================================" | lolcat
		echo "Starting zmap" | randtype -t 5,12000 | lolcat
		echo "================================================================" | lolcat
		echo "NOTE: MAKE SURE TO EDIT THE FILE /etc/zmap/blacklist.conf by adding hash's to allow/block local/certain types of CIDRs."
		echo "Choose a scan to run" | randtype -t 5,12000 | lolcat
		echo "================================================================" | lolcat
		echo "1. SYN Scan" | randtype -t 5,12000 | lolcat
		echo "2. ICMP Scan" | randtype -t 5,12000 | lolcat
		echo "3. UDP Scan" | randtype -t 5,12000 | lolcat
		echo "================================================================" | lolcat
		read -p "Enter scan number>>> " zmap_scan
		echo "================================================================" | lolcat
		echo "Starting scan" | randtype -t 5,12000 | lolcat
		echo "================================================================" | lolcat



		if [[ $zmap_scan == "1" ]] ; then

			read -p "Enter IP to scan>>> " zmap_ip
			read -p "Enter port to scan>>> " zmap_port

			read -p "ZMAP OUTPUT WILL BE SAVED TO zsynscan.txt. PRESS ENTER TO CONTINUE" zmap_0x1
			
			sudo zmap -p $zmap_port -B 10M -f saddr,sport -T 4 -M tcp_synscan $zmap_ip -o zsynscan.txt

			read -p "Show IP output ? (y/n)>>> " zmap_0x2

			if [[ $zmap_0x2 == "y" ]] ; then

				cat zsynscan.txt 

			fi

		elif [[ $zmap_scan == "2" ]] ; then
		
			read -p "Enter IP to scan>>> " zmap_ip
			read -p "Enter port to scan>>> " zmap_port

			read -p "ZMAP OUTPUT WILL BE SAVED TO zicmpscan.txt. PRESS ENTER TO CONTINUE" zmap_0x1
			
			sudo sudo zmap -p $zmap_port -B 10M --probe-module=icmp_echoscan $zmap_ip -o zicmpscan.txt

			read -p "Show IP output ? (y/n)>>> " zmap_0x2

			if [[ $zmap_0x2 == "y" ]] ; then

				cat zicmpscan.txt 

			fi

		elif [[ $zmap_scan == "3" ]] ; then
		
			read -p "Enter IP to scan>>> " zmap_ip
			read -p "Enter port to scan>>> " zmap_port

			read -p "ZMAP OUTPUT WILL BE SAVED TO zudp.txt. PRESS ENTER TO CONTINUE" zmap_0x1
			
			sudo zmap -p $zmap_port -B 10M -f saddr,sport -T 4 -M udp $zmap_ip -o zudp.txt

			read -p "Show IP output ? (y/n)>>> " zmap_0x2

			if [[ $zmap_0x2 == "y" ]] ; then

				cat zudp.txt 

			fi
#
#
#		elif [[ $zmap_scan == "4" ]] ; then
#		
#			read -p "Enter IP to scan>>> " zmap_ip
#			read -p "Enter port to scan>>> " zmap_port
#
#			read -p "ZMAP OUTPUT WILL BE SAVED TO zfinscan.txt. PRESS ENTER TO CONTINUE" zmap_0x1
#			
#			sudo zmap -p $zmap_port -B 1M -f saddr,sport -T 4 -M tcp_finscan $zmap_ip -o zfinscan.txt
#
#			read -p "Show IP output ? (y/n)>>> " zmap_0x2

		fi
}