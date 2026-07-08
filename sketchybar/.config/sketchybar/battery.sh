#!/bin/bash

BATT_INFO=$(pmset -g batt)
PERCENT=$(echo "$BATT_INFO" | grep -o '[0-9]*%' | tr -d '%')

if [ "$SENDER" = "mouse.clicked" ]; then
  open x-apple.systempreferences:com.apple.preference.battery
  exit 0
fi

if   [ "$PERCENT" -gt 90 ]; then ICON=""
elif [ "$PERCENT" -gt 65 ]; then ICON=""
elif [ "$PERCENT" -gt 35 ]; then ICON=""
elif [ "$PERCENT" -gt 10 ]; then ICON=""
else                            ICON=""
fi

sketchybar --set battery icon="$ICON" label="${PERCENT}%"

if echo "$BATT_INFO" | grep -qi "AC power"; then
  sketchybar --set charging drawing=on
else
  sketchybar --set charging drawing=off
fi
