function banner() {

    figletarr=(slant block lean shadow big)
    figrand=$[$RANDOM % ${#figletarr[@]}]
    figlet -f ${figletarr[$figrand]} "FastMap" | randtype -t 5,2000| lolcat

}