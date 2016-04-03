#!/bin/bash
# 

# Load config elements and functions from configuration file
source conf/config.sh

df -h > $LOGDIR/fs_info_habitd.out
lsblk > $LOGDIR/blk_info_habitd.out



  GET_SATUS=$(diff -qs $LOGDIR/fs_info.out $LOGDIR/fs_info_habitd.out)
  if [[ $? -eq 0 ]];then
    echo "files match + " \"$(date)\" >> $LOGFILE
  elif [[ $? -eq 1 ]];then
    echo "files differ + " \"$(date)\" >> $LOGFILE

  else
    break
  fi

