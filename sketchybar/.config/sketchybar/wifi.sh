#!/bin/bash
NETWORK=$(networksetup -getairportnetwork en0 | sed 's/^.*: //')
sketchybar --set wifi label="$NETWORK"
