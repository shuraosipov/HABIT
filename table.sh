#!/bin/bash
row="================================================"
header="\n %-10s %8s %10s %11s\n"
format=" %-10s %08d %10s %11.2f\n"

awk 'BEGIN { print "DEVICE_NAME\tFS_TYPE\tMOUNT_OPTIONS\n"
	     print "===========\t=======\t=============\n";	
		   }

	   { print $1,"\t\t",$3,"\t\t",$4"\n"
	     print "+++\t\t++++++\t\t++++++++++++++++++\n";
	   }
END { print "---------\nFile Complete" }' /etc/mtab | grep -E '(^/|^DEVICE_NAME|^===)' | column -t
