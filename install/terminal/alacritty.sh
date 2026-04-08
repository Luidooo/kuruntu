#!/bin/bash

set -e

KURUNTU_PATH="$HOME/.local/share/kuruntu"
ALACRITTY_PATH="$HOME/.config/alacritty"

# Install alacritty via snap
sudo snap install alacritty --classic

# Link configs
mkdir -p "$ALACRITTY_PATH"

# Backup existing config if present
if [ -f "$ALACRITTY_PATH/alacritty.toml" ]; then
  mv "$ALACRITTY_PATH/alacritty.toml" "$ALACRITTY_PATH/alacritty.toml.bak"
fi

ln -sf "$KURUNTU_PATH/dots/alacritty/alacritty.toml" "$ALACRITTY_PATH/alacritty.toml"
ln -sf "$KURUNTU_PATH/dots/alacritty/shared.toml" "$ALACRITTY_PATH/shared.toml"
ln -sf "$KURUNTU_PATH/dots/alacritty/font-size.toml" "$ALACRITTY_PATH/font-size.toml"
ln -sf "$KURUNTU_PATH/dots/alacritty/pane.toml" "$ALACRITTY_PATH/pane.toml"
ln -sf "$KURUNTU_PATH/dots/alacritty/btop.toml" "$ALACRITTY_PATH/btop.toml"

# Default font: JetBrains Mono
ln -sf "$KURUNTU_PATH/dots/alacritty/fonts/JetBrainsMono.toml" "$ALACRITTY_PATH/font.toml"

# Default theme: Tokyo Night
ln -sf "$KURUNTU_PATH/dots/alacritty/themes/tokyo-night.toml" "$ALACRITTY_PATH/theme.toml"
