#!/bin/bash
# script name : config.sh
# purpose : store configuration elements


# Configuration settings
BASEDIR="/opt/habit"
PIDFILE="/var/run/habit.pid"
SCRIPT="$BASEDIR/habit_service.sh"
HABITD="$BASEDIR/check_changes.sh"


# Main 
LOGFILE="/var/log/habit/habit.log"
LOGFILE_CRON="/var/log/habit/habit_cron.log"
REPORT="/var/log/habit/report.log"

# Sysutil
SYS_UTIL_SCRIPT="/workspace/bench/git/HABIT/sys_util.sh"
SYS_UTIL_LOG="/var/log/habit.out"
SYS_UTIL_LOG_ERR="/var/log/habit.err"
SYS_UTIL_PIDFILE="/var/run/habit.pid"



# CVE Checker
SCAP_DEFINITION=""
CVE_RESULTS=""
CVE_REPORT=""



