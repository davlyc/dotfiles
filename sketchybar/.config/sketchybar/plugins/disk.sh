#!/bin/bash

MOUNT=$1
RAW=$(df -h "$MOUNT" | awk 'NR==2')
PCT=$(echo "$RAW" | awk '{print $5}' | tr -d '%')

if [ "$PCT" -gt 95 ]; then LABEL_COLOR="0xffff0000"
elif [ "$PCT" -gt 90 ]; then LABEL_COLOR="0xffff5733"
elif [ "$PCT" -gt 80 ]; then LABEL_COLOR="0xffFFCFA8"
else LABEL_COLOR="0xffCCCCCC"
fi

BAR=""
for i in $(seq 1 10); do
  [ $((i * 10)) -le "$PCT" ] && BAR="${BAR}█" || BAR="${BAR}░"
done

sketchybar --set "$NAME" label="${BAR} ${PCT}%" label.color="$LABEL_COLOR"

if [ "$SENDER" = "mouse.clicked" ]; then
  if [ "$MOUNT" = "/" ]; then
    open -b com.apple.DiskUtility
  else
    open -a Marta "$HOME"
  fi
fi
