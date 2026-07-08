#!/bin/bash

HOUR=$(date +%H)

if [ "$HOUR" -ge 6 ] && [ "$HOUR" -lt 18 ]; then
  CAVA_THEME_PATH=$HOME/.config/cava/themes/day.conf
  BTOP_THEME=pokedex-day
  BORDER_COLOR=0xcce6a050
else
  CAVA_THEME_PATH=$HOME/.config/cava/themes/night.conf
  BTOP_THEME=pokedex-night
  BORDER_COLOR=0xccd45050
fi

# ─── Cava ───
while IFS='=' read -r key value; do
  key="${key// /}"
  value="${value:1}"
  [ -z "$key" ] && continue
  /usr/bin/sed -i '' "s/^$key = .*/$key = $value/" "$HOME/.config/cava/config"
done < "$CAVA_THEME_PATH"

# ─── Btop ───
/usr/bin/sed -i '' "s/^color_theme = \".*\"/color_theme = \"$BTOP_THEME\"/" "$HOME/.config/btop/btop.conf"

# ─── Borders (live reload) ───
/opt/homebrew/bin/borders active_color=$BORDER_COLOR inactive_color=0x44ffffff width=6.0 hidpi=on style=round &
