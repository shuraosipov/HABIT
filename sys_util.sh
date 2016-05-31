#!/bin/bash

# get real memory usage wo page cache

REAL_MEM="$(free -m | awk 'NR==2{printf "%s\n", $4+$6}')"
NORM_MEM="5000"
CRITICAL="$(free -m | awk 'NR==2{printf "%s\n", $2*30/100}')"


while true
do
  if [[ $REAL_MEM -gt $CRITICAL ]];
  then
   echo "Send alert... Low available memory - $REAL_MEM"
  else
   echo "continue.. - $REAL_MEM."
  fi
sleep 60
done
