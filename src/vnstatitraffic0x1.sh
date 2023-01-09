function traffic() {

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

}

