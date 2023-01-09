function tpackets() {
    
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

}