#!/bin/bash
read -r fs total used avail pct mount <<< "$(df -i /tmp | tail -1)"

color="#50fa7b"
[[ ${pct%\%} -ge 80 ]] && color="#f1fa8c"
[[ ${pct%\%} -ge 90 ]] && color="#ff5555"

text=" ${pct}"

printf -v tooltip "Inodes: %s / %s used (%s)\nFree: %s" "$used" "$total" "$pct" "$avail"

jq -nc --arg text "$text" --arg tooltip "$tooltip" --arg color "$color" \
  '{text: $text, tooltip: $tooltip, color: $color}'
