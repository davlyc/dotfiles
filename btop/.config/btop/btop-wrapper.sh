#!/bin/bash

HOUR=$(date +%H)
CONFIG=~/.config/btop/btop.conf

if [ "$HOUR" -ge 6 ] && [ "$HOUR" -lt 18 ]; then
  THEME=pokedex-day
else
  THEME=pokedex-night
fi

sed -i '' "s/^color_theme = \".*\"/color_theme = \"$THEME\"/" "$CONFIG"

/opt/homebrew/bin/btop "$@"
