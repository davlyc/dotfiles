#!/bin/bash

CORE_COUNT=$(sysctl -n hw.logicalcpu)
CPU_SUM=$(ps -A -o %cpu | awk '{s+=$1} END {printf "%.1f", s}')
CPU_PCT=$(echo "scale=1; $CPU_SUM / $CORE_COUNT" | bc)
VAL=$(echo "scale=2; $CPU_PCT / 100" | bc)

sketchybar --push cpu "$VAL" \
  --set cpu label="${CPU_PCT}%"
