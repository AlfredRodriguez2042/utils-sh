#/bin/bash
#

# Bash css!
red="\033[0;31m"
blue="\033[0;34m"
nc="\033[0m"

#Verify admin
USERID=`id -g`
if [ $USERID == 1000 ]; then
echo ""
else
echo -e "\n${red}Please run the script using admin user${nc}\n"
exit
fi

#Search for external Ip informations.
GetExternalIp(){

curl -s ipinfo.io 

}

# Verify the existence of determined command
Vcheck() {
 hash $1

case $1 in
     git)
       echo "Git: `git --version `"
      ;;
     php)
	echo "PHP: `php -v`"
	;;
     mysql)
	echo "MySql: `mysql --version`"
	;;
     httpd)
	echo "Apache: `httpd -v`"
	;;
    smbclient)
	echo "Samba Client `smbclient -V`"
	;;
    
esac


}

#Display Date
echo -e "\n Date : `date`\n"

# General Info
echo -e "${red}GENERAL INFORMATION ${nc} \n"
echo "Hostname: `hostname`"
echo "`lsb_release -drc`"
echo "UserName: `who`"
echo "Last Logs: `last -20 -ai`"

# Cpu Info
echo -e "\n${red}CPU INFORMATION\n ${nc}"
echo "CPU model: `grep "model name" /proc/cpuinfo | awk -F ":" '{print $02}'`"
echo "CPU Speed: `grep "cpu MHz" /proc/cpuinfo | awk -F ":" '{print $02}'`"
echo "Cache Size: `grep "cache size" /proc/cpuinfo | awk -F ":" '{print $02}'`"

# Memory Info
echo -e "\n${red}MEMORY INFORMATION ${nc}\n"
echo "$(egrep  'Mem|Cache|Swap' /proc/meminfo)"

echo -e "\n${red}FILE SYSTEM INFORMATION ${nc}\n"
echo "`df -h`"

# NET INFO
echo -e "\n${red}NETWORK INFORMATION ${nc}\n"
echo -e "${blue}Hostname:${nc} "
echo "`cat /etc/resolv.conf`"
echo -e "${blue}Ip address: ${nc}"
echo "`ip addr | grep enp0* | grep inet | awk '{print "\033[31m"$7" \033[0m"$2; }'`"
echo -e "${blue}Route:${nc}"
ip route show

#GetExternalIp
echo -e "\n${red}NETWORK INFORMATION ${nc}\n"
GetExternalIp

#Version check

echo -e "\n${red}VERSION INFORMATION ${nc}\n"
Vcheck php
Vcheck mysql
Vcheck smbclient
Vcheck smbd
Vcheck httpd
Vcheck git
