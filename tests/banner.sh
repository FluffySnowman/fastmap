figletarr=(slant block lean shadow big)
figrand=$[$RANDOM % ${#figletarr[@]}]
echo ${figletarr[$figrand]}
figlet -f ${figletarr[$figrand]} "FastMap" | randtype -t 5,2000| lolcat