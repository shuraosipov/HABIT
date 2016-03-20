#!/bin/bash
# HAndy Bash system Information Tool

# define functions
# pauseable
function pause() {
  local message="$@"
  echo "$message"
  read -p "Press [Enter] to continue..." key
}

# show menu options
function show_menu() {
    clear
    echo "===================================="
    echo "HABIT Main Menu"
    echo "===================================="
    echo "1. Show filesystem information"
    echo "2. Show block device information"
    echo "3. List of directories under '/' and their size"
    echo "4. Show disk space usage"
    echo "5. Show top memory & cpu eating process"
    echo "6. Show network config and stats"
    echo "7. Show operating system information"
    echo "8. Show users activity"
    echo "q for Exit"
    echo ""
    read -p "Select menu option: " answer
}


while true
do
  show_menu
  case $answer in
    1) pause "$(df -h)" ;;
    2) pause "$(lsblk)" ;;
    3) pause "$(du -sh /)" ;;
    4) pause "$(df -h)" ;;
    5) ps -eo pcpu,pid,comm,user | sort -nr -k1 | head -10; pause ;;
    6) ip -4 -o -s addr | column -t;
       echo ""
       cat /etc/resolv.conf; pause ;;
    7) pause "$(uname -r)" ;;
    8) pause "$(who)" ;;
    q) break ;;
  esac

done
