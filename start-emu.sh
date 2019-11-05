#!/bin/bash

# display list
SCRIPT_DIR=$(cd $(dirname $0); pwd)
source "$SCRIPT_DIR/list.sh"


ANS1=0
while true
do
    echo -n "Please Select A Device [index] :"
    read ANS
    ANS1=$ANS
    break
done

# index
IND=$ANS1

expr $IND + 1 > /dev/null 2>&1
RET=$?
if [ $RET -lt 1 ]; then
  echo "index is ${IND}"
else
  echo "Error! Invalid Index '$IND'"
  exit 1
fi

# detect device
ARR=(`$ANDROID_HOME/emulator/emulator -list-avds`)
LEN=${#ARR[@]}
if [ ${LEN} -lt $((${IND}+1)) ]; then
  echo "Error! Device not found"
  exit 1
fi
DEV=${ARR[${IND}]}
echo ${DEVNAME}

OPT="-no-snapshot-load"

# start
DEVNAME=`echo $DEV | sed -e "s/[\r\n]\+//g"`
exec ${ANDROID_HOME}/emulator/emulator -avd $DEVNAME $OPT
