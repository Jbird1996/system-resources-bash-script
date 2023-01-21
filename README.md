# Bash script to check system resources.

#!/bin/bash

### Store the current date and time in a variable
current_time=$(date +"%Y-%m-%d %H:%M:%S")

cpu_usage="$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')%"

### Store the current system load in a variable
load=$(uptime | awk '{print $10 $11 $12}')

### Store the current free memory in a variable
free_memory=$(free -m | awk 'NR==2{print $4}')

### Store the current used memory in a variable
used_memory=$(free -m | awk 'NR==2{print $3}')

### Print the current date and time, system load, and memory usage
echo "$current_time, cpu usage= $cpu_usage, system load= $load, $free_memory MB free, $used_memory MB used"

### Append the above data to a log file
echo "$current_time, $load, $free_memory MB free, $used_memory MB used" &>> ~/logs/system_resources.log

Explanation:
The first line #!/bin/bash is called a shebang and it specifies that the script should be executed using the bash shell.

The next line current_time=$(date +"%Y-%m-%d %H:%M:%S") uses the date command to get the current date and time and stores it in the variable current_time.

This line uses the command 'top' to display the current system status and 'grep' to filter the output to only show the line containing the CPU usage. 'awk' is then used to print the second column (which contains the CPU usage). 'cut' is used to remove the "%" symbol from the output, leaving only the numerical value of the CPU usage.

The line load=$(uptime | awk '{print $10 $11 $12}') uses the uptime command to get the current system load and the awk command to extract the 10th, 11th, and 12th fields (which represent the load averages) and stores them in the variable load.

The line free_memory=$(free -m | awk 'NR==2{print $4}') uses the free -m command to get the current memory usage in megabytes and the awk command to extract the fourth field of the second row (which represents the amount of free memory) and stores it in the variable free_memory.

The line used_memory=$(free -m | awk 'NR==2{print $3}') uses the free -m command to get the current memory usage in megabytes and the awk command to extract the third field of the second row (which represents the amount of used memory) and stores it in the variable used_memory.

The next line echo "$current_time, $load, $free_memory MB free, $used_memory MB used" prints the current date and time, system load, and memory usage.

The last line echo "$current_time, $load, $free_memory MB free, $used_memory MB used" >> /var/log/system_monitor.log uses the echo command to append the same data to a log file located at /logs/system_resources.log
