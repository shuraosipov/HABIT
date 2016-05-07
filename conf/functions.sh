#!/bin/bash
# script name : functions.sh
# purpose : store functions


# Load config
source conf/config.sh

# Define functions

# Function 1. check_root
# Check root privileges before starting script execution
function check_root() {
  local user_id
  user_id="$(id -u)"
  if [[ "$user_id" -ne '0' ]]
  then
    printf "%b" "You must be root to start this tool\n"
    exit 987
  fi
}

# Function 2. show_menfu
# Display user menu
# Show menu options
function show_menu() {
  clear
  printf "%b" "====================================\n"
  printf "%b" "HABIT Main Menu\n"
  printf "%b" "====================================\n"
  printf "%b" "1. Show filesystem information\n"
  printf "%b" "2. Show block device information\n"
  printf "%b" "3. List of directories under '/' and their size\n"
  printf "%b" "4. Show disk space usage\n"
  printf "%b" "5. Show top memory & cpu eating process\n"
  printf "%b" "6. Show network config and stats\n"
  printf "%b" "7. Show operating system information\n"
  printf "%b" "8. Show users activity\n"
  printf "%b" "9. Save system information into file\n"
  printf "%b" "q for Exit\n"
  printf "%b" "\n"
  printf "%b" "s. Start HABIT service\n"
  printf "%b" "d. Stop HABIT service\n"
  printf "%b" "\n"
  printf "%b" "n. Start System Utilization daemon\n"
  printf "%b" "m. Stop System Utilization daemon\n"
  printf "%b" "\n"
  printf "%b" "c. Run Common Vulnerabilities and Exposures (CVE) checker\n"
  printf "%b" "\n"
  read -rp "Select menu option: " answer
}


# Function 3. pause
# Keep command output in variable, display it and prompt user for next steps
function pause() {
  local message
  message="$@"
  printf "%b" "$message\n"
  read -rp "Press [Enter] to continue..."
}

# Function 4. start background service
# Add cron entry which checks log files every hour
function start_habitd() {
  if [[ -s "/etc/cron.d/habitd_service" ]];
  then
    echo "Service already started..."
    read -rp "Press [Enter] to continue..."
  else
    echo "0 7 * * * root /opt/habit/check_changes.sh" > /etc/cron.d/habitd_service && echo "HABIT service started"
  fi
}

# Function 5. stop_habitd
# Remove cron entry
function stop_habitd() {
  if [[ -e "/etc/cron.d/habitd_service" ]];
  then
    rm -f /etc/cron.d/habitd_service && echo "HABIT service stopped"
    read -rp "Press [Enter] to continue..."
  else
    echo "HABIT service not started..."
  fi
}

# Function 6. save system information into file
function save_sysinfo() {
  if [[ -e "$1" ]];
  then
    mv "$1" "$1"-$(date +"%d-%m-%y");
  else
    touch "$1"
  fi

  {
    df -h;
    echo "";

    lsblk;
    echo "";

    du -sh /home/;
    echo "";

    df -h;
    echo "";

    echo "Most CPU consuming processes: "
    ps -eo pcpu,pid,comm,user | sort -nr -k1 | head -10;
    echo "Most Memory consuming processes:";
    ps -eo %mem,pid,comm,user | sort -nr -k1 | head -10;
    echo "";

    ip -4 -o -s addr | column -t;
    echo ""
    cat /etc/resolv.conf;
    echo ""

    echo -n "Linux Distribution name: "; cat /etc/*-release | head -n 1;
    echo -n "Kernel version: "; uname -r;
    echo ""

    who
    echo ""

  } > "$1"

}


# Function 7. compare files and send email to amdin if differs
function check_changes() (
  GET_SATUS=$(diff -qs $LOGFILE $LOGFILE_CRON)
  if [[ $? -eq 0 ]];then
    echo "files match + " \"$(date)\" >> $REPORT
  else
    echo "files differ + " \"$(date)\" >> $REPORT
  fi
)

# Function 8. Start system utilization daemon
function start_sysutils() (
  daemonize -a -e ${SYS_UTIL_LOG_ERR} -o ${SYS_UTIL_LOG} -p ${SYS_UTIL_PIDFILE} ${SYS_UTIL_SCRIPT}
  if [[ $? -eq 0 ]]
    then
      echo "System utilization daemon started successfull"
  else
      echo "unable to start system utilization daemon"
  fi
)

# Function 9. Stop system utilization daemon
function stop_sysutils () (
  kill -TERM $(cat ${SYS_UTIL_PIDFILE}) && rm -f ${SYS_UTIL_PIDFILE}
  if [[ $? -eq 0 ]]
    then
      echo "System utilization daemon stopped successfull"
  else
      echo "Unable to stop system utilization daemon"
  fi 

)

# Function 10. Start CVE check
function start_cvecheck() (
  oscap oval eval --results ${CVE_RESULTS --report ${CVE_REPORT} ${SCAP_DEFINITION} 2>&1 /dev/null
  if [[ $? -ne 0 ]]
    then
      echo "CVE scan done. Find report here - ${CVE_REPORT}"
  else 
      echo "CVE scan done with errors"
  fi


)
