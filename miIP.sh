#!/bin/bash
red="\033[0;31m"
blue="\033[0;34m"
nc="\033[0m"
# Mi public IP
echo -e "${red} MI PUBLIC IP ADRESS${nc}"
echo " IP `curl -s icanhazip.com`"

# Internal IPS
echo -e "${red}using Nmap check all ips in local netwok${nc}"
echo "Ips Local Status: `nmap -sn 192.168.1.0/24 -oG -`"
echo -e "${red}CHECK PORTS IN LOCAL NETWOK${nc}"
echo "More info: `nmap 192.168.1.0/24`"
