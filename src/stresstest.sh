function stresstest() {
    echo "YOU WILL NEED GPING INSTALLED AND TMUX TO MONITOR STRESS TESTING"

		cd stress_testing

		read -p "udp/tcp?>>> " stresstest_0x1

		if [[ $stresstest_0x1 == "udp" ]] ; then	

			read -p "IP/URL to stress>>> " stresstest_urlip	
			
			
			tmux new-session -d -s mainsesh "ping $stresstest_urlip"
			tmux split-pane

			read -p "PORT to stress>>> " stresstest_port		
			read -p "Amount of time to stress (seconds)>>> " stresstest_seconds

			tmux send-keys -t 1 "python3 start.py udp ""$stresstest_urlip":"$stresstest_port"" 10000 $stresstest_seconds" ENTER
			tmux attach-session

			notify-send "STRESS TEST COMPLETE :)"

			tmux send-keys -t 1 "echo TYPE IN EXIT TO GO BACK TO FASTMAP AND PRESS CNTL+C OR Q TO QUIT THE GRAPHICAL PINGING" ENTER

		elif [[ $stresstest_0x1 == "tcp" ]] ; then

			read -p "IP/URL to stress>>> " stresstest_urlip	
			read -p "PORT to stress>>> " stresstest_port		
			
			
			tmux new-session -d -s mainsesh "ping $stresstest_urlip"
			tmux split-pane
	
			read -p "Amount of time to stress (seconds)>>> " stresstest_seconds
			
			tmux send-keys -t 1 "python3 start.py tcp ""$stresstest_urlip":"$stresstest_port"" 10000 "$stresstest_seconds"" ENTER
			tmux attach-session

			notify-send "STRESS TEST COMPLETE :)"

			tmux send-keys -t 1 "echo TYPE IN EXIT TO GO BACK TO FASTMAP AND PRESS CNTL+C OR Q TO QUIT THE GRAPHICAL PINGING" ENTER

			cd ..

		fi

}
