#!/bin/bash

source "$KURUNTU_PATH/utils/strings/en_us.sh"
clear

gum style \
  --border normal \
  --margin "1" \
  --padding "1 2" \
  --border-foreground 212 \
  "$WELCOME_HEADER" "$WELCOME_BODY"

gum confirm "$WELCOME_CONFIRM_QUESTION" || exit 0

bash "$KURUNTU_PATH/utils/menus/mains_menu.sh"
