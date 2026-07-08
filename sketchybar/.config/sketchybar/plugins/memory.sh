#!/bin/bash

if [ "$SENDER" = "mouse.clicked" ]; then
  open -a "Activity Monitor"
  exit 0
fi

FREE=$(memory_pressure | grep "System-wide memory free percentage" | awk '{print $5}' | tr -d '%')
PCT=$((100 - FREE))
VAL=$(echo "scale=2; $PCT / 100" | bc)

sketchybar --push memory "$VAL" \
  --set memory label="${PCT}%"
