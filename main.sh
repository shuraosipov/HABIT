#!/bin/bash
# Usage : bash main.sh
# HAndy Bash system Information Tool

# Include config elements and functions from configuration file
CONFIG_FILE="config.sh"
source "$CONFIG_FILE"

# Start script execution
while true
do
  show_menu
  case $answer in
    1) pause "$(df -h)" | tee fs_info.out ;;

    2) pause "$(lsblk)" | tee blk_info.out ;;

    3) pause "$(du -sh /home/shuraosipov/)" | tee dir_info.out ;;

    4) pause "$(df -h)" | tee dsk_info.out ;;

    5) echo "Most CPU consuming processes: " | tee sys_info.out;
       ps -eo pcpu,pid,comm,user | sort -nr -k1 | head -10 | tee -a sys_info.out;
       echo "Most Memory consuming processes:" | tee -a sys_info.out
       ps -eo %mem,pid,comm,user | sort -nr -k1 | head -10 | tee -a sys_info.out;
       pause ;;

    6) ip -4 -o -s addr | column -t | tee ip_info.out;
       echo "" | tee -a ip_info.out
       cat /etc/resolv.conf | tee -a ip_info.out;
       pause ;;

    7) echo -n "Linux Distribution name: "; cat /etc/*-release | head -n 1 | tee os_info.out;
       echo -n "Kernel version: "; uname -r | tee -a  os_info.out;
       pause ;;

    8) pause "$(who)" | tee who_info.out ;;

    q) exit 0 ;;

    # additinal features
    s) pause "Starting HABIT service..." ;;
  esac

done
