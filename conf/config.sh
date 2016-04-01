#!/bin/bash
# script name : config.sh
# purpose : store configuration elements


# Configuration settings

# Log file location

BASEDIR="/opt/habit"
PIDFILE="/var/run/habit.pid"
LOGDIR="/var/log/habit"
LOGFILE="/var/log/habit/habit.log"
SCRIPT="$BASEDIR/habit_service.sh"
HABITD="$BASEDIR/checker.sh"
