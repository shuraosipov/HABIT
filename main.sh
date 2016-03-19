#!/bin/bash


pause() {
  declare m="$@"
  echo "$m"
  read -p "Press [Enter] to continue..." key
}

while true
do
    clear
    echo " "
    echo "Menu: "
    echo "=================================================="
    
    echo "1 - Display file system information and parameters"
    echo "2 - Block devices installed on the system"
    echo "3 - List of directories under "/" partition with total amount of each directory"
    echo "4 - Disk space usage"
    echo "5 - Current system utilization (CPU, Memory, IO, Net)"
    echo "6 - Network configuration, mount points, runlevel, startup scrupts, cron jobs"
    echo "7 - Kernel version, OS version, etc."
    echo "8 - Uptime, last login with details, list of logged in users, last commands executed"
    echo "q for exit"
    
    echo " "
    read -r -p "Enter your choise [1-8]: " answer
	
    case $answer in
      1) pause "$(mount)" ;;
      2) pause "$(lsblk)" ;;
      3) pause "$(du -sh /home/shuraosipov)" ;;
	  q) break	;; 
      *) pause "$(echo "Invalid option")" ;;
    esac







done
