#!/bin/bash

ARR=(`$ANDROID_HOME/emulator/emulator -list-avds`)
I=0
for v in ${ARR[@]}; do
  echo "${I} ${v}"
  I=$((${I}+1))
done

