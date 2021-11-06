#!/bin/bash

br=$'\n'
ipAddress=$(hostname -I)
lines=""
sensors | grep '^Core\s[[:digit:]]\+:' | (while read line;
do
  IN="$line"
  arrIN=(${IN/ /})
  lines+="${br}${arrIN[0]} ${arrIN[1]}"
done
telegram-send "SENSORS YOUR_SERVER $ipAddress$lines")
