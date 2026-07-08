#!/bin/bash

HOUR=$(date +%H)
CONFIG=~/.config/cava/config

if [ "$HOUR" -ge 6 ] && [ "$HOUR" -lt 18 ]; then
  THEME=~/.config/cava/themes/day.conf
else
  THEME=~/.config/cava/themes/night.conf
fi

while IFS='=' read -r key value; do
  key="${key// /}"
  value="${value:1}"
  [ -z "$key" ] && continue
  sed -i '' "s/^$key = .*/$key = $value/" "$CONFIG"
done < "$THEME"

/opt/homebrew/bin/cava
