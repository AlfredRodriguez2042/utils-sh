#!/bin/bash
# Variables
red="\033[0;31m"
blue="\033[0;34m"
nc="\033[0m"

cpu=$(cat /sys/class/thermal/thermal_zone0/temp)
gpu=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)
echo -e "${red}GENERAL INFORMATION ${nc} \n"
echo "Name:           `uname -n`"
echo "`lsb_release -drc`"


echo -e "\n${red}CPU INFORMATION\n ${nc}"
echo "CPU model: `grep "model name" /proc/cpuinfo | awk -F ":" '{print $02}'`"
echo "CPU Speed: `grep "cpu MHz" /proc/cpuinfo | awk -F ":" '{print $02}'`"
echo "$(lspci |grep VGA)" 
echo "------------------------------------------------"
echo "Temperature CPU ==> $((cpu/1000))'Cº"
echo "Temperature GPU ==> $(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)'Cº"

echo -e "\n${red}SENSORS INFORMATION ${nc}\n"
echo "$(sensors -A)"

echo -e "\n${red}MEMORY INFORMATION ${nc}\n"
echo "$(egrep  'Mem|Cache|Swap' /proc/meminfo)"
