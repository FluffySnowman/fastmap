#!/bin/bash

echo "NOTE: USE LOWER CASE FOR ALL INPUTS"

read -p "Press [ENTER] to start program"

echo ""

figlet -f slant "FastMap" | randtype -t 5,2000| lolcat

echo ""

read -p "Value of i: " increment
echo ""
echo "NOW THE PROGRAM WILL LOOP. PRESS CNTL+C TO QUIT"
echo "WIFIAUDIT MODULE IS BROKEN. DO NOT USE!!!" | randtype -t 5,12000 | lolcat
echo "MAKE SURE YOU HAVE SNORT INSTALLED AND CONFIGURED BEFORE RUNNING THE SNORT COMMAND!!!"
echo ""

echo "================================================================" | lolcat

while [ $increment -lt 100 ]
do

	read -p ">>> " prompt_input
	if [[ $prompt_input == "exit" ]] || [[ $prompt_input == "quit" ]] || [[ $prompt_input == "q" ]] ; then

		echo "Exiting program"
		break

	elif [[ $prompt_input == "netmap" ]] ; then

		echo "Starting nmap module" | randtype -t 5,12000 | lolcat
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

			echo "Commencing arp scan of subnet" | randtype -t 5,12000 | lolcat
			sudo nmap -sn -vvv $ipsub_scanvar_0x1 

		elif [[ $scan_type_0x1 == "syn" ]] ; then

			echo "Commencing syn scan of subnet" | randtype -t 5,12000 | lolcat
			sudo nmap -sS -vvv $ipsub_scanvar_0x1 

		elif [[ $scan_type_0x1 == "os" ]] ; then

			echo "Commencing os scan of subnet" | randtype -t 5,12000 | lolcat
			sudo nmap -O -vvv $ipsub_scanvar_0x1 

		fi
	
	elif [[ $prompt_input == "rscan" ]] ; then

		echo "Make sure to download rustscan from https://github.com/RustScan/RustScan/releases before continuing with this command"

		echo "Starting rust scan" | randtype -t 5,12000 | lolcat
		read -p "Enter host+/subnet to scan>>> " rscan_var_0x1

		rustscan -a $rscan_var_0x1

		echo "Scan Complete"

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

		echo "Opening packet catching interface..." | lolcat
		echo "================================================================" | lolcat
		echo "AVAILABLE INTERFACES"
		tcpdump -D | randtype -t 5,2000 | lolcat
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
		echo "Packet tracing module" | randtype -t 5,12000 | lolcat
		read -p "Enter host to trace packets to>>> " trace_0x1
		read -p "ipv4 or ipv6(4/6)>>> " trace_type_0x1
		traceroute -$trace_type_0x1 $trace_0x1
		echo "================================================================" | lolcat

	elif [[ $prompt_input == "nsl" ]] ; then

		echo "================================================================" | lolcat
		echo "Nameserver lookup module" | randtype -t 5,12000 | lolcat
		read -p "Enter IP or domain to lookup>>> " nsl_0x1
		nslookup $nsl_0x1
		echo "================================================================" | lolcat
	
	elif [[ $prompt_input == "ss" ]] ; then

		echo "================================================================" | lolcat
		echo "Showing main ss runners" | randtype -t 5,12000 | lolcat
		ss -t -a 
		echo "================================================================" | lolcat
	
	elif [[ $prompt_input == "gtrace" ]] ; then

		echo "================================================================" | lolcat
		read -p "Trace and ping to host>>> " mtr_0x1 | randtype -t 5,12000 | lolcat
		echo "STARTING MTR GUI"
		sudo mtr $mtr_0x1
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
		echo "Starting graphical pinging interface" | randtype -t 5,12000 | lolcat
		sleep 3
		gping $gping_0x1
		echo "================================================================" | lolcat

	elif [[ $prompt_input == "pymap" ]] ; then

		echo "================================================================" | lolcat
		read -p "Enter gateway to scan for>>> " pymap_0x1

		sudo python3 pymap.py -t $pymap_0x1 > online_hosts_pymap.txt
		echo "Calculating total amount of online hosts..." | randtype -t 5,12000 | lolcat
		cat online_hosts_pymap.txt
		cat online_hosts_pymap.txt | grep -v -e "-----------------------------------" -e "IP Address" -e "MAC Address" | wc -l > total_hosts_online_pymap.txt
		cat total_hosts_online_pymap.txt && echo " hosts online"

		echo "================================================================" | lolcat
	
	elif [[ $prompt_input == "wifiaudit" ]] ; then 

		read -p "ONLY KEEP 2 TERMINAL TABS/WINDOWS OPEN!! PRESS ENTER WHEN YOU HAVE DONE THIS" null0x1
		echo "USING TTY SESSIONS AT /DEV/PTS/* TO CONTROL NOW. CNTL+C TO ABORT"
		sleep 1

		read -p "Enter tty number for terminal 1>>> " tty_0x1
		read -p "Enter tty number for terminal 2>>> " tty_0x2

		sleep 1
		echo "Starting" > /dev/pts/$tty_0x1
		echo "Starting" > /dev/pts/$tty_0x2
		sleep 1

		echo "...."
		sleep 1 
		echo "........"
		sleep 1
		echo "2 TERMINAL MODE ENABLED" | lolcat
		echo "================================================================" | lolcat
		
		sudo airmon-ng > /dev/pts/$tty_0x2
		read -p "Enter interface to scan for networks on>>> " wifiaudit_0x1 > /dev/pts/$tty_0x1
		read -p "press [ENTER] to start monitor mode" wifiaudit_mon_0x1 > /dev/pts/$tty_0x1

		#sudo airmon-ng check kill
		#sudo airmon-ng start ""$wifiaudit_0x1"mon" > /dev/pts/$tty_0x1

		read -p "PRESS ENTER TO START LOOKING FOR NETWORKS " wifiaudit_mon_0x2 > /dev/pts/$tty_0x1

		echo "KEEP THE BSSID, STATION ID AND CHANNEL ID NOTED DOWN FOR THE NEXT COMMAND" > /dev/pts/$tty_0x2

		#sudo airodump-ng $wifiaudit_0x1 > /dev/pts/$tty_0x1

		#sudo airmon-ng stop ""$wifiaudit_0x1"mon"



		
		
		read -p "Enter BSSID and MAC of station to deauthenticate" wifiaudit_1x1 > /dev/pts/$tty_0x2




		echo "================================================================" | lolcat
		echo "Lets get into hacking!"
		echo "Please have your superuser's username and password noted down for this..."
		echo "Starting module..."
		sleep 3
		echo 
		

	elif [[ $prompt_input == "cls" ]] ; then

		clear

	elif [[ $prompt_input == "l" ]] ; then

		fc -e : -1
	
	elif [[ $prompt_input == "pyport" ]] ; then

		echo "================================================================" | lolcat
		echo "Starting Python Port Scanner" | randtype -t 5,12000 | lolcat
		echo "This is gonna be a bit slow" | randtype -t 5,12000 | lolcat
		read -p "Enter ip address to scan>>> " pyport_0x1
		sudo python3 pyport.py $pyport_0x1
		echo "================================================================" | lolcat
	
	elif [[ $prompt_input == "traffic" ]] ; then

		echo "================================================================" | lolcat
		
		echo "You must have vnstat install for this"
		echo "INTERFACES:"

		ip a

		read -p "Interface to collect data on>>> " traffic_interface_0x1
		read -p "Hour(h)/5min(5)/pi()>>> " traffice_0x1

		if [[ $traffice_0x1 == "h" ]] ; then

			vnstat -h -i $traffic_interface_0x1
			vnstati -h -i $traffic_interface_0x1 -o vnstati_hourly.png
			echo "Graph saved to vnstati_hourly.png in this folder"

		elif [[ $traffice_0x1 == "5" ]] ; then

			vnstat -5 -i $traffic_interface_0x1
			vnstati -5 -i $traffic_interface_0x1 -o vnstati_5.png
			echo "Graph saved to vnstati_5.png in this folder"

		elif [[ $traffice_0x1 == "pi" ]] ;  then

			vnstati -s -i $traffic_interface_0x1 -o vnstati_pi.png
			echo "Graph saved to vnstati_pi.png in this folder"

		fi

		echo "================================================================" | lolcat

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

		figletarr=(slant block lean shadow big)
		figrand=$[$RANDOM % ${#figletarr[@]}]
		figlet -f ${figletarr[$figrand]} "FastMap" | randtype -t 5,2000| lolcat
	
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

		echo "YOU WILL NEED GPING INSTALLED AND TMUX TO MONITOR STRESS TESTING"

		cd stress_testing

		read -p "udp/tcp?>>> " stresstest_0x1

		if [[ $stresstest_0x1 == "udp" ]] ; then	

			read -p "IP/URL to stress>>> " stresstest_urlip	
			
			
			tmux new-session -d -s mainsesh "ping $stresstest_urlip"
			tmux split-pane

			read -p "PORT to stress>>> " stresstest_port		
			read -p "Amount of time to stress (seconds)>>> " stresstest_seconds

			tmux send-keys -t 1 "python3 start.py udp ""$stresstest_urlip":"$stresstest_port"" 100 $stresstest_seconds" ENTER
			tmux attach-session

			notify-send "STRESS TEST COMPLETE :)"

			tmux send-keys -t 1 "echo TYPE IN EXIT TO GO BACK TO FASTMAP AND PRESS CNTL+C OR Q TO QUIT THE GRAPHICAL PINGING" ENTER

		elif [[ $stresstest_0x1 == "tcp" ]] ; then

			read -p "IP/URL to stress>>> " stresstest_urlip	
			read -p "PORT to stress>>> " stresstest_port		
			
			
			tmux new-session -d -s mainsesh "ping $stresstest_urlip"
			tmux split-pane
	
			read -p "Amount of time to stress (seconds)>>> " stresstest_seconds
			
			tmux send-keys -t 1 "python3 start.py tcp ""$stresstest_urlip":"$stresstest_port"" 100 "$stresstest_seconds"" ENTER
			tmux attach-session

			notify-send "STRESS TEST COMPLETE :)"

			tmux send-keys -t 1 "echo TYPE IN EXIT TO GO BACK TO FASTMAP AND PRESS CNTL+C OR Q TO QUIT THE GRAPHICAL PINGING" ENTER

			cd ..

		fi

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
	
	elif [[ $prompt_input == "help" ]] ; then

		echo "================================================================" | lolcat
		echo "help: displays this help menu"
		echo "banner: prints fastmap banner with a random figlet font"
		echo "netmap: opens network mapping module" | randtype -t 5,2000 | lolcat
		echo "rscan: pipes input to rustscan and displays results" | randtype -t 5,2000 | lolcat 
		echo "zenmap: starts nmap-gui (zenmap) through the terminal"
		echo ""
		echo "gui: STARTS GUI FASTMAP MODULE" | randtype -t 5,2000 | lolcat
		echo ""
		echo "tpackets: captures packets on specified interface" | lolcat
		echo "ping: opens ping module"
		echo "stresstest: opens module to test the response time of servers" | randtype -t 5,2000 | lolcat
		echo "traffic: open traffic total monitoring module"
		echo "snort: sniffs network for malicious packets and intruisions" | randtype -t 5,2000 | lolcat
		echo "speed: opens speed testing module (speedtest-cli)"
		echo "gp: opens graphical pinging module" | randtype -t 5,2000 | lolcat
		echo "trace: traces packets to specified host"
		echo "gtrace: traces packets to specified host in GUI" | lolcat
		echo "nsl: lookup nameservers"
		echo "lhost: lookup hosts"
		echo "pymap: runs python network mapping module" | randtype -t 5,2000 | lolcat
		echo "pyport: runs python port scanning module"
		echo "ss: shows ss runners" 
		echo "fapi: opens fing api calling module" 
		echo "wifiaudit: tried to hack wifi networks"
		echo "scan: scans for wireless networks around you"
		echo "who: lookup ip with WHOIS" | randtype -t 5,2000 | lolcat
		echo "ipl: finds information about specified IP" | randtype -t 5,2000 | lolcat
		RED='\033[0;31m'
		printf "${RED}exit/quit/q: exits program\n"
		echo "================================================================" | lolcat
	
	else 
		
		$prompt_input
		echo "Command not found in the fastmap program!"
		echo "Use the help command to see all commands available" | lolcat
	
	fi

	let "increment=increment+1"
	
done
figlet -f slant "Goodbye!" | lolcat
