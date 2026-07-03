#!/bin/bash
read -r fs total used avail pct mount <<< "$(df -i /tmp | tail -1)"

color="#50fa7b"
[[ ${pct%\%} -ge 80 ]] && color="#f1fa8c"
[[ ${pct%\%} -ge 90 ]] && color="#ff5555"

text=" ${pct}"

tooltip="Inodes: ${used} / ${total} used (${pct})
Free: ${avail}"

echo "{\"text\": \"${text}\", \"tooltip\": \"${tooltip}\", \"color\": \"${color}\"}"
