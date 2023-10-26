function banner() {

    figletarr=(slant block lean shadow big)
    figrand=$[$RANDOM % ${#figletarr[@]}]
    figlet -f ${figletarr[$figrand]} "FastMap" | lolcat

}
