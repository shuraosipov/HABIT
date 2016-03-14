#!/bin/bash

# Display filesystem information
echo "------------------"
echo ""
printf "The following filesystems is mounted: "
printf "\n"
mount | grep -E "(^/dev|^UUID|^/)" | column -t
printf "\n"

# Display LVM and block device information
echo "------------------"
echo ""
printf "The following block devices installed on the system: \n"
lsblk --output NAME,FSTYPE,SIZE,MOUNTPOINT
