#!/bin/bash

killall clock_loop 2>/dev/null

while true; do
    sketchybar --trigger clock_tick
    sleep 1
done
