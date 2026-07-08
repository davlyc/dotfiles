#!/bin/bash
MEM=$(memory_pressure | grep "System-wide" | awk '{print $NF}')
sketchybar --set memory label="$MEM"
