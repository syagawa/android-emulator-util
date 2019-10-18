#!/bin/bash

# display list
source list.sh

# index
IND=0
if [ $# = 0 ]; then
  IND=0
elif [ $# = 1 ]; then
  IND=$1
else
  echo "error"
  exit 1
fi
echo "index is ${IND}"

# detect device
ARR=(`$ANDROID_HOME/emulator/emulator -list-avds`)
LEN=${#ARR[@]}
if [ ${LEN} -lt $((${IND}+1)) ]; then
  echo "error"
  exit 1
fi
DEV=${ARR[${IND}]}
echo ${DEVNAME}

OPT="-no-snapshot-load"

# start
DEVNAME=`echo $DEV | sed -e "s/[\r\n]\+//g"`
exec ${ANDROID_HOME}/emulator/emulator -avd $DEVNAME $OPT
