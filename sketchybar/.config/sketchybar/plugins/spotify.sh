#!/bin/bash

if [ "$SENDER" = "mouse.clicked" ]; then
  osascript -e 'tell application "Spotify" to activate'
  exit 0
fi

STATE=$(osascript -e 'if application "Spotify" is running then tell application "Spotify" to player state as string')

if [ "$STATE" = "playing" ]; then
  TRACK=$(osascript -e 'tell application "Spotify" to name of current track')
  ARTIST=$(osascript -e 'tell application "Spotify" to artist of current track')
  sketchybar --set $NAME label="$TRACK - $ARTIST" label.drawing=on drawing=on
else
  sketchybar --set $NAME drawing=on label.drawing=off
fi
