#!/bin/bash
#

# Load config elements and functions from configuration file
source conf/config.sh
source conf/functions.sh

save_sysinfo $LOGFILE_CRON

check_changes
