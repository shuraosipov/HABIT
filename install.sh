#!/bin/bash
BASEDIR="/opt/habit"
LOGDIR="/var/log/habit"

if [[ -d $BASEDIR ]]; then
  echo "Directory $BASEDIR already exists"
  exit 1
else
  mkdir -p $BASEDIR
  cp -rf * $BASEDIR
  rm -f $BASEDIR/install.sh
  chmod -R 755 $BASEDIR
  echo "HABIT successfully installed"
fi


if [[ -d $LOGDIR ]]; then
  echo "Directory $LOGDIR already exists"
  exit 1
else
  mkdir -p $LOGDIR
  chmod -R 755 $LOGDIR
fi
