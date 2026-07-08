#!/bin/bash

CACHE=/tmp/.fastfetch_verse_cache
MAX=38

pick_verse() {
  sort -R ~/.config/fastfetch/bible-verses.txt | head -1 > "$CACHE"
}

get_lines() {
  local verse=$(cat "$CACHE")
  if [ ${#verse} -le $MAX ]; then
    echo "$verse"
  else
    echo "$verse" | fold -s -w $MAX
  fi
}

case "${1:-pick}" in
  pick)
    pick_verse
    get_lines | sed -n '1p'
    ;;
  [0-9]*)
    if [ ! -f "$CACHE" ]; then exit 1; fi
    line=$(get_lines | sed -n "${1}p")
    if [ -n "$line" ]; then
      echo "$line"
    else
      exit 1
    fi
    ;;
esac