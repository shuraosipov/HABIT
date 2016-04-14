#!/bin/bash

# get real memory usage wo page cache

REALMEM="$(free -m | awk 'NR==2{printf "%s\n", $4+$6}')"
HIGH_NORMA="5000"
PERCENTS="$(free -m | awk 'NR==2{printf "%s\n", $2*30/100}')"


echo $PERCENTS

if [[ $REALMEM -gt $HIGH_NORMA ]];
then
 echo "Send alert... Low available memory - $REALMEM"
else
 echo "continue.. - $REALMEM."
fi

