#!/bin/bash

bar() {
  local pct=$1
  local filled=$(( (pct + 5) / 10 ))
  local bar
  for ((i = 0; i < filled; i++)); do bar+="█"; done
  for ((i = filled; i < 10; i++)); do bar+="░"; done
  echo "$bar"
}

read -r fs total used avail pct mount <<< "$(df -i /tmp | tail -1)"
pct_num=${pct%\%}

color="#50fa7b"
[[ $pct_num -ge 80 ]] && color="#f1fa8c"
[[ $pct_num -ge 90 ]] && color="#ff5555"

text="$(bar "$pct_num") ${pct}"

printf -v tooltip "Inodes:  %'d / %'d\nUsage:   %s\nFree:    %'d\n%s %s" \
  "$used" "$total" "$pct" "$avail" "$(bar "$pct_num")" "$pct"

jq -nc --arg text "$text" --arg tooltip "$tooltip" --arg color "$color" \
  '{text: $text, tooltip: $tooltip, color: $color}'
