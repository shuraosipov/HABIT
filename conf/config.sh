#!/bin/bash
# script name : config.sh
# purpose : store configuration elements
# Distribution Name


# Configuration settings
BASEDIR="/etc/habit"
PIDFILE="/var/run/habit.pid"
SCRIPT="$BASEDIR/habit_service.sh"
HABITD="$BASEDIR/check_changes.sh"

# Main
LOGDIR="/var/log/habit"
LOGFILE="$LOGDIR/habit.log"
LOGFILE_CRON="$LOGDIR/habit_cron.log"
REPORT="$LOGDIR/report.log"

# Sysutil
SYS_UTIL_SCRIPT="$BASE_DIR/sys_util.sh"
SYS_UTIL_LOG="$LOGDIR/habit.out"
SYS_UTIL_LOG_ERR="$LOGDIR/habit.err"
SYS_UTIL_PIDFILE="/var/run/habit.pid"

# CVE Checker
SCAP_DEFINITION=""
CVE_RESULTS="$LOGDIR/oscap/cve_results_$(date +%d%m%Y).xml"
CVE_REPORT="$LOGDIR/oscap/cve_report_$(date +%d%m%Y).html"
CVE_LOG="$LOGDIR/oscap/cvescanner.log"
