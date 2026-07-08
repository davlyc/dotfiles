#!/bin/bash

# The verified path
WARP_BIN="/usr/local/bin/warp-cli"

# 1. Handle Click Interaction
if [ "$SENDER" = "mouse.clicked" ]; then
  # Check current state
  STATE=$($WARP_BIN status | grep "Status update" | awk '{print $NF}')
  
  if [ "$STATE" = "Connected" ]; then
    $WARP_BIN disconnect
  else
    $WARP_BIN connect
  fi
  
  # Give the WARP daemon a moment to register the change
  sleep 1.5
fi

# 2. Update the UI Status
# We check for 'Connected' specifically
RAW_STATUS=$($WARP_BIN status | grep "Status update" | awk '{print $NF}')

if [ "$RAW_STATUS" = "Connected" ]; then
  sketchybar --set "$NAME" icon.color=0xffff5733 label=" ON"
else
  sketchybar --set "$NAME" icon.color=0xff777777 label=" OFF"
fi