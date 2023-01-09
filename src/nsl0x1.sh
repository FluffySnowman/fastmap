function nsl() {

		echo "================================================================" | lolcat
		echo "Nameserver lookup module" | randtype -t 5,12000 | lolcat
		read -p "Enter IP or domain to lookup>>> " nsl_0x1
		nslookup $nsl_0x1
		echo "================================================================" | lolcat
	
}
