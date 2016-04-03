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
    1) pause "$(df -h)" | tee $LOGDIR/filesystem.info ;;

    2) pause "$(lsblk)" | tee $LOGDIR/block_dev.info ;;

    3) pause "$(du -sh /home/)" | tee $LOGDIR/dir_size.info ;;

    4) pause "$(df -h)" | tee $LOGDIR/disk_usage.info ;;

    5) echo "Most CPU consuming processes: " | tee $LOGDIR/sys_utilization.info;
       ps -eo pcpu,pid,comm,user | sort -nr -k1 | head -10 | tee -a $LOGDIR/sys_utilization.info;
       echo "Most Memory consuming processes:" | tee -a $LOGDIR/sys_utilization.info;
       ps -eo %mem,pid,comm,user | sort -nr -k1 | head -10 | tee -a $LOGDIR/sys_utilization.info;
       pause ;;

    6) ip -4 -o -s addr | column -t | tee $LOGDIR/network.info;
       echo "" | tee -a $LOGDIR/network.info
       cat /etc/resolv.conf | tee -a $LOGDIR/network.info;
       pause ;;

    7) echo -n "Linux Distribution name: "; cat /etc/*-release | head -n 1 | tee $LOGDIR/os.info;
       echo -n "Kernel version: "; uname -r | tee -a  $LOGDIR/os.info;
       pause ;;

    8) pause "$(who)" | tee $LOGDIR/sys_usage.info ;;

    q) exit 0 ;;

    # Stop/Start habitd service
    s) start_habitd ;;
    d) stop_habitd  ;;
  esac

done
