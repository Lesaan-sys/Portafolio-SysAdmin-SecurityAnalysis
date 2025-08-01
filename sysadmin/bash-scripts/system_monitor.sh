#!/bin/bash

#Define the trehshold values for CPU, memory and disk usage (percentage)

CPU_TRESHHOLD=80
MEMORY_TREHSHOLD=80
DISK_TRESHHOLD=80

#Function to send and alert
send_alert() {
  echo "$(tput setaf 1)ALERT: $1 usage exceed treshold current value: $2%$(tput sgr0)"
}

cpu_usage=${cpu_usage%.*} #Convert integer
echo "Current CPU usage: $cpu_usage%"

if ((cpu_usage >= CPU_TRESHHOLD)); then
     send_alert "CPU" "$cpu_usage"
fi  

#Monitor memory 
memory_usage=$(free | awk '/Mem/ {printf("%3.1f", ($3/$2) * 100 )}')
echo "Current memory usage: $memory_usage%"
memory_usage=${memory_usage%.*}
if ((memory_usage >= MEMORY_THRESHOLD)); then
    send_alert "Memory" "$memory_usage"
fi

#Monitor disk
disk_usage=$(df -h / | awk '/\// {printf $(NF-1)}')
disk_usage=${disk_usage%?}
echo "Current disk usage: $disk_usage%"
 
if ((disk_usage >= DISK_TRESHOLD)); then
   send_alert "Disk" "$disk_usage"
fi 
 
#Display current stats
clear
echo "Resource Usage:"
echo "------------------"
echo "CPU Usage: $cpu_usage%"
echo "Memory Usage: $memory_usage%"
echo "Disk Usage: $disk_usage%"
sleep 2
done
