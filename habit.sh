#!/bin/bash
# Usage : bash habit.sh
# HAndy Bash system Information Tool

# Include config elements and functions from configuration file
source conf/config.sh
source conf/functions.sh

# Start script execution
while true
do
  show_menu
  case $answer in
    1) pause "$(df -h)" | tee $LOGDIR/fs_info.out ;;

    2) pause "$(lsblk)" | tee $LOGDIR/blk_info.out ;;

    3) pause "$(du -sh /home/shuraosipov/)" | tee $LOGDIR/dir_info.out ;;

    4) pause "$(df -h)" | tee $LOGDIR/dsk_info.out ;;

    5) echo "Most CPU consuming processes: " | tee $LOGDIR/sys_info.out;
       ps -eo pcpu,pid,comm,user | sort -nr -k1 | head -10 | tee -a $LOGDIR/sys_info.out;
       echo "Most Memory consuming processes:" | tee -a $LOGDIR/sys_info.out
       ps -eo %mem,pid,comm,user | sort -nr -k1 | head -10 | tee -a $LOGDIR/sys_info.out;
       pause ;;

    6) ip -4 -o -s addr | column -t | tee $LOGDIR/ip_info.out;
       echo "" | tee -a $LOGDIR/ip_info.out
       cat /etc/resolv.conf | tee -a $LOGDIR/ip_info.out;
       pause ;;

    7) echo -n "Linux Distribution name: "; cat /etc/*-release | head -n 1 | tee $LOGDIR/os_info.out;
       echo -n "Kernel version: "; uname -r | tee -a  $LOGDIR/os_info.out;
       pause ;;

    8) pause "$(who)" | tee $LOGDIR/who_info.out ;;

    q) exit 0 ;;

    # Stop/Start habitd service
    s) start_habitd ;;
    d) stop_habitd  ;;
  esac

done
