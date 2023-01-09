function netmap { 
    echo "Starting nmap module" | randtype -t 5,12000 | lolcat
		read -p "Enter host+/subnet to scan>>> " ipsub_scanvar_0x1
        read -p "What type of scan do you want to do? (syn/port/os/arp/tp(tcp connect port)/lp(list open ports))>>> " scan_type_0x1

		if [[ $scan_type_0x1 == "port" ]] ; then

			read -p "Scan all ports(y/n)>>> " scanyesnotcp

			if [[ $scanyesnotcp == "y" ]] ; then

				sudo nmap -p0- -A -T4 -vvv $ipsub_scanvar_0x1 
			    echo "Scan Complete" | randtype -t 5,12000 | lolcat

            else
				echo "scan cancelled"
			fi
		elif [[ $scan_type_0x1 == "lp" ]] ; then

			echo "Screen will remain blank for a bit"
			echo "================================================================" | lolcat
			sudo nmap -p0- -A -T4 -vvv $ipsub_scanvar_0x1 | grep "open port" > open_ports.txt
			cat open_ports.txt
			echo "================================================================" | lolcat
			echo "Amount of open ports: "
			echo | wc -l open_ports.txt
			echo "================================================================" | lolcat

		elif [[ $scan_type_0x1 == "arp" ]] ; then

			echo "Commencing arp scan of subnet" | randtype -t 5,12000 | lolcat
			sudo nmap -sn -vvv $ipsub_scanvar_0x1 
            echo "Scan Complete" | randtype -t 5,12000 | lolcat

		elif [[ $scan_type_0x1 == "syn" ]] ; then

			echo "Commencing syn scan of subnet" | randtype -t 5,12000 | lolcat
			sudo nmap -sS -vvv $ipsub_scanvar_0x1 
            echo "Scan Complete" | randtype -t 5,12000 | lolcat


        elif [[ $scan_type_0x1 == "tp" ]] ; then

            echo "Commencing tcp connect port scan" | randtype -t 5,12000 | lolcat
            sudo nmap -sT -vvv $ipsub_scanvar_0x1
            echo "Scan Complete" | randtype -t 5,12000 | lolcat

        elif [[ $scan_type_0x1 == "os" ]] ; then

			echo "Commencing os scan of subnet" | randtype -t 5,12000 | lolcat
			sudo nmap -O -vvv $ipsub_scanvar_0x1 
            echo "Scan Complete" | randtype -t 5,12000 | lolcat

		fi
}
