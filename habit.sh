#!/bin/bash
# Usage : bash habit.sh
# HAndy Bash system Information Tool

# Load config elements and functions from configuration file
source conf/config.sh
source conf/functions.sh


# Start script execution
while true
do
  show_menu
  case $answer in
    1) pause "$(df -h)" ;;

    2) pause "$(lsblk)" ;;

    3) pause "$(du -sh /home/)" ;;

    4) pause "$(df -h)" ;;

    5) echo "Most CPU consuming processes: ";
       ps -eo pcpu,pid,comm,user | sort -nr -k1 | head -10;
       echo "Most Memory consuming processes:";
       ps -eo %mem,pid,comm,user | sort -nr -k1 | head -10;
       pause ;;

    6) ip -4 -o -s addr | column -t;
       echo ""
       cat /etc/resolv.conf;
       pause ;;

    7) echo -n "Linux Distribution name: "; cat /etc/*-release | head -n 1;
       echo -n "Kernel version: "; uname -r;
       pause ;;

    8) pause "$(who)";;

    9) save_sysinfo $LOGFILE;
       echo "System information saved to $LOGFILE file"
       pause ;;

    q) exit 0 ;;

    # Stop/Start habitd service
    s) start_habitd; pause ;;
    d) stop_habitd; pause ;;
  esac

done
