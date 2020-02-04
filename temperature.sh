#!/bin/bash
# Variables
cpu=$(cat /sys/class/thermal/thermal_zone0/temp)
gpu=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)
echo "Name:           $(uname -n)"
echo "$(lsb_release -drc)"
echo "------------------------------------------------"
echo "Info:"
echo "$(lspci |grep VGA)" 
echo "------------------------------------------------"
echo "Temperature CPU ==> $((cpu/1000))'Cº"
echo "Temperature GPU ==> $(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)'Cº"
echo "------------------------------------------------"
echo "Sensors:"
echo "$(sensors -A)"
echo "------------------------------------------------"
echo "Memory:"
echo "$(egrep  'Mem|Cache|Swap' /proc/meminfo)"
