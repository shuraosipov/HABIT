#!/bin/bash


pause() {
  declare m="$@"
  echo "$m"
  read -p "Press [Enter] to continue..." key
}

pause
