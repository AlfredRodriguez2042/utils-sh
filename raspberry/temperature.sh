#!/bin/bash
 # Shell script: temp.sh
  cpu=$(cat /sys/class/thermal/thermal_zone0/temp)
  echo "Equipo =>       $(hostname)"
  echo  "$(lsb_release -drc)"
  echo "------------------------------"
  echo "Temp.CPU => $((cpu/1000))'Cº"
  echo "Temp.GPU => $(/opt/vc/bin/vcgencmd measure_temp)"
  echo "------------------------------"
  echo "CPU"
  echo "$(vcgencmd measure_clock arm)Hz"
  echo "$(vcgencmd measure_volts core)"
  echo "Mem. del Sistema $(vcgencmd get_mem arm)"
  echo "Mem. de la $(vcgencmd get_mem gpu)"
  echo "------------------------------"
  echo "Consumo de memoria"
  echo "$(egrep --color 'Mem|Cache|Swap' /proc/meminfo)"
