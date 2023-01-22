#!/bin/bash

# Store the current date and time in a variable
current_time=$(date +"%Y-%m-%d %H:%M:%S")

cpu_usage="$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')%"

# Store the current system load in a variable
load=$(uptime | awk '{print $10 $11 $12}')

# Store the current free memory in a variable
free_memory=$(free -m | awk 'NR==2{print $4}')

# Store the current used memory in a variable
used_memory=$(free -m | awk 'NR==2{print $3}')

# Print the current date and time, system load, and memory usage
echo "$current_time, cpu usage= $cpu_usage, system load= $load, $free_memory MB free, $used_memory MB used"

# Append the above data to a log file
echo "$current_time, cpu usage= $cpu_usage, system load= $load, $free_memory MB free, $used_memory MB used" &>> ~/logs/system_resources.log
