#!/bin/bash
df -h > fs_info_habitd.out
lsblk > blk_info_habitd.out


diff -qs fs_info.out fs_info_habitd.out
if [[ $? -eq 0 ]];then
  echo "files match"
elif [[ $? -eq 1 ]];then
  echo "files differ"
  touch /tmp/lallaa
else
  break
fi
