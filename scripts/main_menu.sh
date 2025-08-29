#!/bin/bash

# Load the strings from the external file
source "$(dirname "$0")/../strings/en_us.sh"

# Display the header
gum style \
	--border normal \
	--margin "1" \
	--padding "1 2" \
	--border-foreground 212 \
	"$MAIN_MENU_HEADER" "$MAIN_MENU_BODY"

# Display the menu and capture the selections
gum style --padding "1 0" "Choose the software to install:"
INSTALL_SELECTIONS=$(gum choose \
	"Neovim" \
	"Vim" \
	"Node.js" \
	"Ruby" \
	"Rust" \
	"Docker" \
	"Btop" \
	"Chrome" \
	"Fonts" \
	"Hyprland" \
	"Mise" \
	"Nerd-Icons" \
	"Zellij" \
	--no-limit \
	--height 15)

# If nothing was selected, exit
if [ -z "$INSTALL_SELECTIONS" ]; then
	gum style --foreground "99" "No items selected. Exiting."
	exit 0
fi

# Confirm the selections
gum style --padding "1 0" "You have selected:"
gum style --foreground "212" "$INSTALL_SELECTIONS"
gum confirm "Proceed with the installation?" || exit 0

# --- Installation Logic ---
echo "Starting installation for selected components..."

# Loop through the selections and call the respective scripts
# Note: This assumes you have installer scripts in install/<component>.sh
for SELECTION in $INSTALL_SELECTIONS; do
	# Convert selection to lowercase to match script names
	SCRIPT_NAME=$(echo "$SELECTION" | tr '[:upper:]' '[:lower:]')
	SCRIPT_PATH="../install/$SCRIPT_NAME.sh"

	if [ -f "$SCRIPT_PATH" ]; then
		gum spin --spinner dot --title "Installing $SELECTION..." -- bash "$SCRIPT_PATH"
		echo "✅ Successfully installed $SELECTION"
	else
		echo "❌ Warning: Installer script not found for $SELECTION at $SCRIPT_PATH"
	fi
done

gum style --padding "1 0" --foreground "212" "All selected installations are complete! 🎉"
