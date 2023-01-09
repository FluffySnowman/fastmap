function gtrace() {
		echo "================================================================" | lolcat
		read -p "Trace and ping to host>>> " mtr_0x1 | randtype -t 5,12000 | lolcat
		echo "STARTING MTR GUI"
		sudo mtr $mtr_0x1
		echo "EXITING MTR"
		echo "================================================================" | lolcat
}

