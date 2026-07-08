#!/bin/bash
HOUR=$(date +%H)
CONFIG=/Users/davinyonathan/.config/cava/config
if [ "$HOUR" -ge 6 ] && [ "$HOUR" -lt 18 ]; then
  THEME=/Users/davinyonathan/.config/cava/themes/day.conf
else
  THEME=/Users/davinyonathan/.config/cava/themes/night.conf
fi
while IFS='=' read -r key value; do
  key="${key// /}"
  value="${value:1}"
  [ -z "$key" ] && continue
  /usr/bin/sed -i '' "s/^$key = .*/$key = $value/" "$CONFIG"
done < "$THEME"
