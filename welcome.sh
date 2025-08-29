#!/bin/bash

# Load the strings from the external file
source "$(dirname "$0")/strings/en_us.sh"

# Clear the screen for a clean start
clear

# Display the welcome message using gum styles
gum style \
	--border normal \
	--margin "1" \
	--padding "1 2" \
	--border-foreground 212 \
	"$WELCOME_HEADER" "$WELCOME_BODY"

# Ask for confirmation to proceed
gum confirm "$WELCOME_CONFIRM_QUESTION" || exit 0

# --- The rest of the script will start here ---
"$(dirname "$0")/scripts/main_menu.sh"

