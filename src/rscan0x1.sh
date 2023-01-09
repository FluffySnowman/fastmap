function rscan() {

		echo "Make sure to download rustscan from https://github.com/RustScan/RustScan/releases before continuing with this command"

		echo "Starting rust scan" | randtype -t 5,12000 | lolcat
		read -p "Enter host+/subnet to scan>>> " rscan_var_0x1

		rustscan -a $rscan_var_0x1

		echo "Scan Complete"

}