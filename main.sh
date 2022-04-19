#!/bin/bash

#echo "PREREQUISITES: figlet, curl, jq, lolcat, nmap, sudo, tcpdump, traceroute, ss, host, nslookup, mtr"
#echo "PLEASE INSTALL THESE libraries WITH YOUR PACKAGE MANAGER"
#echo "NOTE: USE LOWER CASE FOR ALL INPUTS"

# Hopefully this works
# https://unix.stackexchange.com/questions/235605/check-if-all-listed-packages-are-installed-in-bash
printf "\033c"
echo "Checking Packages..."
packages=("figlet" "curl" "jq" "lolcat" "nmap" "sudo" "tcpdump" "traceroute" "ss" "host" "nslookup" "mtr")
for pkg in ${packages[@]}; do

    is_pkg_installed=$(dpkg-query -W --showformat='${Status}\n' ${pkg} | grep "install ok installed")

    if [ "${is_pkg_installed}" == "install ok installed" ]; then
        echo ${pkg} is installed.
    else
	apt-get install -y $pkg
    fi
done




# Terminal Clear
printf "\033c"

figlet -f slant "FastMap" | lolcat

echo "\nValue of i: $increment\nNOW THE PROGRAM WILL LOOP. PRESS CNTL+C TO QUIT\n\n"

divider="================================================================" | lolcat

while [ $increment -lt 100 ]
do

	read -p ">>> " prompt_input
	if [[ $prompt_input == "exit" ]] ; then

		echo "Exiting program"
		break

	elif [[ $prompt_input == "netmap" ]] ; then

		echo "Starting nmap module"
		read -p "Enter host+/subnet to scan>>> " ipsub_scanvar_0x1
		read -p "What type of scan do you want to do? (syn/port/os/arp/lp(list open ports))>>> " scan_type_0x1

		if [[ $scan_type_0x1 == "port" ]] ; then

			read -p "Scan all ports(y/n)>>> " scanyesnotcp

			if [[ $scanyesnotcp == "y" ]] ; then
				sudo nmap -p0- -A -T4 -vvv $ipsub_scanvar_0x1 
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

			echo "Commencing arp scan of subnet"
			sudo nmap -sn -vvv $ipsub_scanvar_0x1 

		elif [[ $scan_type_0x1 == "syn" ]] ; then

			echo "Commencing syn scan of subnet"
			sudo nmap -sS -vvv $ipsub_scanvar_0x1 

		elif [[ $scan_type_0x1 == "os" ]] ; then

			echo "Commencing os scan of subnet"
			sudo nmap -O -vvv $ipsub_scanvar_0x1 

		fi
	elif [[ $prompt_input == "fapi" ]] ; then
		read -p "API url with auth key: " api_url1
		echo "ENTERED API URL: $api_url1"

		read -p "Display api raw data? (y/n): " rawdata_ask
		if [[ $rawdata_ask == "n" ]] ; then
			echo "Not displaying raw data"
			read -p "Enter array values to query (with dot notation for jq[except for the first delimiter]): " array_header_0x1
			curl -s $api_url1 | jq ".$array_header_0x1"
		else
			curl -s $api_url1 | jq "."
		fi
	elif [[ $prompt_input == "ping" ]] ; then
	
		read -p "Enter host to ping>>> " ping_host_0x1
		read -p "How many seconds to ping>>> " ping_seconds_0x1
		sudo ping -c $ping_seconds_0x1 $ping_host_0x1
	
	elif [[ $prompt_input == "tpackets" ]] ; then

		echo "Opening packet catching interface..." | lolcat
		echo "================================================================" | lolcat
		echo "AVAILABLE INTERFACES"
		tcpdump -D | lolcat
		echo "================================================================" | lolcat
		sleep 3
		echo "PRESS CNTL+C TO STOP THE PACKETS FROM BEING CAPTURED"
		read -p "Interface name>>> " tt
		sleep 3
		echo "Starting capture..."
		sudo tcpdump -w packets.pcap -i $tt
		echo "ALL PACKETS CAPTURED"
		echo "================================================================" | lolcat
		sudo tcpdump -r packets.pcap
		echo "================================================================" | lolcat

	elif [[ $prompt_input == "trace" ]] ; then

		echo "================================================================" | lolcat
		echo "Packet tracing module"
		read -p "Enter host to trace packets to>>> " trace_0x1
		read -p "ipv4 or ipv6(4/6)>>> " trace_type_0x1
		traceroute -$trace_type_0x1 $trace_0x1
		echo "================================================================" | lolcat

	elif [[ $prompt_input == "nsl" ]] ; then

		echo "================================================================" | lolcat
		echo "Nameserver lookup module"
		read -p "Enter IP or domain to lookup>>> " nsl_0x1
		nslookup $nsl_0x1
		echo "================================================================" | lolcat
	
	elif [[ $prompt_input == "ss" ]] ; then

		echo "================================================================" | lolcat
		echo "Showing main ss runners"
		ss -t -a 
		echo "================================================================" | lolcat
	
	elif [[ $prompt_input == "gtrace" ]] ; then

		echo "================================================================" | lolcat
		read -p "Trace and ping to host>>> " mtr_0x1
		echo "STARTING MTR GUI"
		mtr $mtr_0x1
		echo "EXITING MTR"
		echo "================================================================" | lolcat
	
	elif [[ $prompt_input == "lhost" ]] ; then

		echo "================================================================" | lolcat
		read -p "Host to lookup>>> " host_0x1
		echo "Looking up host"
		host $host_0x1
		echo "================================================================" | lolcat
	
	elif [[ $prompt_input == "gp" ]] ; then

		echo "================================================================" | lolcat
		read -p "Hosts to ping>>> " gping_0x1
		echo "Starting graphical pinging interface"
		sleep 3
		gping $gping_0x1
		echo "================================================================" | lolcat

	elif [[ $prompt_input == "pymap" ]] ; then

		echo "================================================================" | lolcat
		read -p "Enter gateway to scan for>>> " pymap_0x1

		sudo python3 pymap.py -t $pymap_0x1 > online_hosts_pymap.txt
		echo "Calculating total amount of online hosts..."
		cat online_hosts_pymap.txt
		cat online_hosts_pymap.txt | grep -v -e "-----------------------------------" -e "IP Address" -e "MAC Address" | wc -l > total_hosts_online_pymap.txt
		cat total_hosts_online_pymap.txt && echo " hosts online"

		echo "================================================================" | lolcat
	
	elif [[ $prompt_input == "help" ]] ; then

		echo "================================================================" | lolcat
		echo "help: displays this help menu"
		echo "netmap: opens network mapping module" | lolcat
		echo "tpackets: captures packets on specified interface" | lolcat
		echo "ping: opens ping module"
		echo "gp: opens graphical pinging module" | lolcat
		echo "trace: traces packets to specified host"
		echo "gtrace: traces packets to specified host in GUI" | lolcat
		echo "nsl: lookup nameservers"
		echo "lhost: lookup hosts"
		echo "pymap: runs python network mapping module" | lolcat
		echo "ss: shows ss runners" 
		echo "fapi: opens fing api calling module" 
		echo "exit: exits program"
		echo "================================================================" | lolcat
	
	else 
		
		$prompt_input
	
	fi

	let "increment=increment+1"

done

figlet -f slant "Goodbye!" | lolcat
