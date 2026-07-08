#!/bin/bash

HOUR=$(date +%H)
DIR=~/.config/fastfetch

if [ "$HOUR" -ge 6 ] && [ "$HOUR" -lt 18 ]; then
  TARGET=logo_day.png
else
  TARGET=logo_night.png
fi

ln -sf "$TARGET" "$DIR/logo.png"

/opt/homebrew/bin/fastfetch
