#!/bin/bash

E_PATH="$ANDROID_HOME/emulator/emulator"
if test -e $E_PATH; then
  CMD="$E_PATH -list-avds"
else
  echo "Colud not find Emulator"
  exit 1
fi

ARR=$($CMD)

I=0
for v in ${ARR[@]}; do
  echo "${I} ${v}"
  I=$((${I}+1))
done