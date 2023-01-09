function trace() {

		echo "================================================================" | lolcat
		echo "Packet tracing module" | randtype -t 5,12000 | lolcat
		read -p "Enter host to trace packets to>>> " trace_0x1
		read -p "ipv4 or ipv6(4/6)>>> " trace_type_0x1
		traceroute -$trace_type_0x1 $trace_0x1
		echo "================================================================" | lolcat

}
