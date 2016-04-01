#!/bin/bash
source conf/config.sh

while true
do
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
sleep 5
done
