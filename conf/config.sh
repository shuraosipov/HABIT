#!/bin/bash
# script name : config.sh
# purpose : store configuration elements


# Configuration settings
BASEDIR="/opt/habit"
PIDFILE="/var/run/habit.pid"
SCRIPT="$BASEDIR/habit_service.sh"
HABITD="$BASEDIR/check_changes.sh"

# Log file location
LOGDIR="/var/log/habit"

# Log file name
# Main log file for habit
LOGFILE="/var/log/habit/habit.log"
LOGFILE_CRON="/var/log/habit/habit_cron.log"
REPORT="/var/log/habit/report.log"

# Log files for
