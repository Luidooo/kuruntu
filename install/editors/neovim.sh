#!/bin/bash

# Exit on error
set -e

# Variables
CONFIG_DIR="$HOME/.config"
DOTFILES_DIR="$HOME/.dotfiles"
WAKATIME_KEY="YOUR_WAKATIME_API_KEY" # Replace with your actual key

# Install Neovim
sudo snap install nvim --classic

# Configure Neovim
if [ -d "$CONFIG_DIR/nvim" ]; then
  rm -rf "$CONFIG_DIR/nvim"
fi
cp -r "$DOTFILES_DIR/dots/dot_nvim" "$CONFIG_DIR/nvim"

# Wakatime API key
echo "For wakatime, please insert the following API key in Neovim:"
echo "$WAKATIME_KEY"
