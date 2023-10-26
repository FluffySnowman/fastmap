#!/bin/bash

source ./src/netmap0x1.sh
source ./src/rscan0x1.sh
source ./src/trace0x1.sh
source ./src/nsl0x1.sh
source ./src/gtrace0x1.sh
source ./src/pymap0x1.sh
source ./src/vnstatitraffic0x1.sh
source ./src/banner.sh
source ./src/stresstest.sh
source ./src/zmap.sh
source ./src/tpackets.sh

# COLOURS
REDCOLOUR='\033[0;31m'
GREENCOLOUR='\033[0;32m'
BLUECOLOUR='\033[0;34m' 
BOLDBLUECOLOUR='\033[1;34m'
YELLOWCOLOUR='\033[1;33m'
RESETCOLOUR='\033[0m' # BACK TO NORMAL



echo "NOTE: USE LOWER CASE FOR ALL INPUTS"

read -p "Press [ENTER] to start program"

echo ""

banner

echo ""
echo "Made by the FluffySnowman"
echo ""

echo "edit /etc/zmap/blacklist.conf to remove local IPs" 
echo ""

echo "================================================================" | lolcat

while [ 1 -lt 100 ]
do

	read -p ">>> " prompt_input
	if [[ $prompt_input == "exit" ]] || [[ $prompt_input == "quit" ]] || [[ $prompt_input == "q" ]] ; then

		echo "Exiting program"
		break

	elif [[ $prompt_input == "netmap" ]] ; then

		netmap

	elif [[ $prompt_input == "rscan" ]] ; then

		rscan

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
		echo "PING COMPLETED" | randtype -t 5,12000 | lolcat
	
	elif [[ $prompt_input == "tpackets" ]] ; then

		tpackets

	elif [[ $prompt_input == "trace" ]] ; then

		trace

	elif [[ $prompt_input == "nsl" ]] ; then

		nsl

	elif [[ $prompt_input == "ss" ]] ; then

		echo "================================================================" | lolcat
		echo "Showing main ss runners" | randtype -t 5,12000 | lolcat
		ss -t -a 
		echo "================================================================" | lolcat
	
	elif [[ $prompt_input == "gtrace" ]] ; then

		gtrace

	elif [[ $prompt_input == "lhost" ]] ; then

		echo "================================================================" | lolcat
		read -p "Host to lookup>>> " host_0x1
		echo "Looking up host"
		host $host_0x1
		echo "================================================================" | lolcat
	
	elif [[ $prompt_input == "gp" ]] ; then

		echo "================================================================" | lolcat
		read -p "Hosts to ping>>> " gping_0x1
		echo "Starting graphical pinging interface" | randtype -t 5,12000 | lolcat
		sleep 3
		gping $gping_0x1
		echo "================================================================" | lolcat

	elif [[ $prompt_input == "pymap" ]] ; then

		pymap

	elif [[ $prompt_input == "wifiaudit" ]] ; then 


		echo "wifiaudit module currently under development!"

		# read -p "ONLY KEEP 2 TERMINAL TABS/WINDOWS OPEN!! PRESS ENTER WHEN YOU HAVE DONE THIS" null0x1
		# echo "USING TTY SESSIONS AT /DEV/PTS/* TO CONTROL NOW. CNTL+C TO ABORT"
		# sleep 1

		# read -p "Enter tty number for terminal 1>>> " tty_0x1
		# read -p "Enter tty number for terminal 2>>> " tty_0x2

		# sleep 1
		# echo "Starting" > /dev/pts/$tty_0x1
		# echo "Starting" > /dev/pts/$tty_0x2
		# sleep 1

		# echo "...."
		# sleep 1 
		# echo "........"
		# sleep 1
		# echo "2 TERMINAL MODE ENABLED" | lolcat
		# echo "================================================================" | lolcat
		
		# sudo airmon-ng > /dev/pts/$tty_0x2
		# read -p "Enter interface to scan for networks on>>> " wifiaudit_0x1 > /dev/pts/$tty_0x1
		# read -p "press [ENTER] to start monitor mode" wifiaudit_mon_0x1 > /dev/pts/$tty_0x1

		# #sudo airmon-ng check kill
		# #sudo airmon-ng start ""$wifiaudit_0x1"mon" > /dev/pts/$tty_0x1

		# read -p "PRESS ENTER TO START LOOKING FOR NETWORKS " wifiaudit_mon_0x2 > /dev/pts/$tty_0x1

		# echo "KEEP THE BSSID, STATION ID AND CHANNEL ID NOTED DOWN FOR THE NEXT COMMAND" > /dev/pts/$tty_0x2

		# #sudo airodump-ng $wifiaudit_0x1 > /dev/pts/$tty_0x1

		# #sudo airmon-ng stop ""$wifiaudit_0x1"mon"



		
		
		# read -p "Enter BSSID and MAC of station to deauthenticate" wifiaudit_1x1 > /dev/pts/$tty_0x2




		# echo "================================================================" | lolcat
		# echo "Lets get into hacking!"
		# echo "Please have your superuser's username and password noted down for this..."
		# echo "Starting module..."
		# sleep 3
		# echo 
		

	elif [[ $prompt_input == "cls" ]] ; then

		clear

	elif [[ $prompt_input == "l" ]] ; then

		fc -e : -1
	
	elif [[ $prompt_input == "pyport" ]] ; then

		echo "================================================================" | lolcat
		echo "THIS MODULE REQUIRES PYTHON"
		echo "Starting Python Port Scanner" | randtype -t 5,12000 | lolcat
		echo "This is gonna be a bit slow" | randtype -t 5,12000 | lolcat
		read -p "Enter ip address to scan>>> " pyport_0x1
		sudo python3 pyport.py $pyport_0x1
		echo "================================================================" | lolcat
	
	elif [[ $prompt_input == "traffic" ]] ; then

		traffic

	elif [[ $prompt_input == "speed" ]] ; then

		echo "================================================================" | lolcat
		echo "Starting speedtest-cli" | randtype -t 5,12000 | lolcat

		speedtest-cli

		echo "Speedtest completed successfully" | randtype -t 5,12000 | lolcat		
		echo "================================================================" | lolcat

	elif [[ $prompt_input == "zenmap" ]] ; then

		echo "================================================================" | lolcat
		echo "Starting zenmap (gui nmap)" | randtype -t 5,12000 | lolcat
		sudo zenmap
		echo "Closing zenmap..." | randtype -t 5,12000 | lolcat
		echo "================================================================" | lolcat
		
	elif [[ $prompt_input == "banner" ]] ; then

		banner

	elif [[ $prompt_input == "scan" ]] ; then

		echo "================================================================" | lolcat
		echo "Starting wavemon" | randtype -t 5,12000 | lolcat

		sudo wavemon

		echo "Stopped wavemon" | randtype -t 5,12000 | lolcat
		echo "================================================================" | lolcat
	
	elif [[ $prompt_input == "snort" ]] ; then

		echo "================================================================" | lolcat
		echo "Starting snort interface........................................" | randtype -t 5,12000 | lolcat
		echo "MAKE SURE YOU HAVE INSTALLED SNORT ALREADY BEFORE RUNNING THIS" | randtype -t 5,12000 

		read -p "Enter gateway/netmask>>> " snort_0x1
		echo "PRESS CNTL+C TO STOP SNORTING" | randtype -t 5,12000 | lolcat

		sudo snort -d -l /var/log/snort/ -h $snort_0x1 -A console -c /etc/snort/snort.conf

		echo "================================================================" | lolcat
	
	elif [[ $prompt_input == "gui" ]] ; then

		bash guimap.sh
	
	elif [[ $prompt_input == "stresstest" ]] ; then

		stresstest

	elif [[ $prompt_input == "ipl" ]] ; then

			read -p "IP to lookup>>> " iplookup_0x1
			curl http://ip-api.com/json/$iplookup_0x1 > iplookup.txt
			cat iplookup.txt | jq .
			rm iplookup.txt
	
	elif [[ $prompt_input == "who" ]] ; then

		echo "================================================================" | lolcat
		read -p "Enter IP to find Information on>>> " whois_ip
		whois $whois_ip
		echo "================================================================" | lolcat
	
	
	elif [[ $prompt_input == "mscn" ]] ; then

		echo "================================================================" | lolcat
		read -p "Enter IP to scan>>> " mscn_ip
		echo "================================================================" | lolcat
		echo "Starting masscan" | randtype -t 5,12000 | lolcat
		echo "================================================================" | lolcat
		read -p "Enter Port(s) to scan for [seperate with   ,   or use   -   for a range]>>> " mscn_port
		echo "================================================================" | lolcat
		echo "Starting masscan" | randtype -t 5,12000 | lolcat
		echo "================================================================" | lolcat

		sudo masscan -p $mscn_port $mscn_ip --rate 100000 -oG masscan.txt
		cat masscan.txt
		echo "Results saved to masscan.txt" | lolcat

		echo "================================================================" | lolcat

	elif [[ $prompt_input == "zmap" ]] ; then

		zmap

	elif [[ $prompt_input == "help" ]] ; then

		# echo -e "${GREENCOLOUR}================================================================${RESETCOLOUR}" 
		echo -e "\nhelp\t\tdisplays this help menu"
		echo -e "banner\t\tprints fastmap banner with a random figlet font"
		echo -e "\n${BLUECOLOUR}netmap\t\t${RESETCOLOUR}opens network mapping module" 
		echo -e "${BLUECOLOUR}rscan\t\t${RESETCOLOUR}pipes input to rustscan and displays results" 
		echo -e "${BLUECOLOUR}zenmap\t\t${RESETCOLOUR}starts nmap-gui (zenmap) through the terminal"
		echo -e "${BLUECOLOUR}zmap\t\t${RESETCOLOUR}opens zmap module"
		echo -e "${BLUECOLOUR}mscs\t\t${RESETCOLOUR}opens masscan module"

		# echo -e "${BLUECOLOUR} ${RESETCOLOUR}"

		echo -e "\n${GREENCOLOUR}gui\t\t${RESETCOLOUR}starts zenity GUI fastmap\n"

		echo -e "${YELLOWCOLOUR}tpackets\t${RESETCOLOUR}captures packets on specified interface"
		echo -e "${YELLOWCOLOUR}ping\t\t${RESETCOLOUR}opens ping module"

		echo -e "${GREENCOLOUR}stresstest\t${RESETCOLOUR}stress test specified IP's bandwidth etc"

		echo -e "${BLUECOLOUR} ${RESETCOLOUR}"
		echo -e "${YELLOWCOLOUR}traffic\t${RESETCOLOUR}total traffic monitoring module"

		echo -e "${YELLOWCOLOUR}snort\t\t${RESETCOLOUR}sniffs network for malicious packets and intruisions"
		echo "speed: opens speed testing module (speedtest-cli)"
		echo "gp: opens graphical pinging module" | lolcat
		echo "trace: traces packets to specified host"
		echo "gtrace: traces packets to specified host in GUI" #| lolcat
		echo "nsl: lookup nameservers"
		echo "lhost: lookup hosts"
		echo "pymap: runs python network mapping module" #| randtype -t 5,2000 | lolcat
		echo "pyport: runs python port scanning module"
		echo "ss: shows ss runners" 
		echo "fapi: opens fing api calling module" 
		echo "wifiaudit: tried to hack wifi networks"
		echo "scan: scans for wireless networks around you"
		echo "who: lookup ip with WHOIS" #| randtype -t 5,2000 | lolcat
		echo "ipl: finds information about specified IP" | lolcat
        echo ""
        echo ""
		RED='\033[0;31m'
		printf "${RED}exit/quit/q: exits program\n"
		echo "================================================================" | lolcat
	
	elif [[ $prompt_input == "" ]] ; then

		echo "hello" > /dev/null

	else 
		
		$prompt_input
		echo "Command not found in the fastmap program!"
		echo "Use the help command to see all commands available" | lolcat
	
	fi

	let "increment=increment+1"
	
done
figlet -f slant "Goodbye!" | lolcat
