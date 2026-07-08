#!/bin/bash

format() {
  local b=$1
  if [ "$b" -gt 1048576 ]; then
    echo "$(echo "scale=1; $b / 1048576" | bc) MB/s"
  elif [ "$b" -gt 1024 ]; then
    echo "$(echo "scale=1; $b / 1024" | bc) KB/s"
  else
    echo "${b} B/s"
  fi
}

read -r TOTAL_DL TOTAL_UL <<< "$(
  nettop -J bytes_in,bytes_out -t wifi -P -n -L 2 -d -s 1 -x 2>/dev/null \
  | awk -F',' 'BEGIN{s=0} /^time/{s++; next} s==2{ti+=$3; to+=$4} END{print ti, to}'
)"

sketchybar --set network_down label="$(format "$TOTAL_DL")" \
           --set network_up label="$(format "$TOTAL_UL")"
