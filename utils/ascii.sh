#!/bin/bash

kuruntu_art='
 _  __                      _
| |/ /   _ _ __ _   _ _ __ | |_ _   _
| ´ / | | | ´__| | | | ´_ \| __| | | |
| . \ |_| | |  | |_| | | | | |_| |_| |
|_|\_\__,_|_|   \__,_|_| |_|\__|\__,_|
'

colors=(
  '\033[38;5;81m' # Cyan
  '\033[38;5;75m' # Light Blue
  '\033[38;5;69m' # Sky Blue
  '\033[38;5;63m' # Dodger Blue
  '\033[38;5;57m' # Deep Sky Blue
  '\033[38;5;51m' # Cornflower Blue
  '\033[38;5;45m' # Royal Blue
)

IFS=$'\n' read -rd '' -a lines <<<"$kuruntu_art"

for i in "${!lines[@]}"; do
  color_index=$((i % ${#colors[@]}))
  echo -e "${colors[color_index]}${lines[i]}"
done

echo -e "\033[0m"
