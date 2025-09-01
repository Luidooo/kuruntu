#!/bin/bash

# Exit on error
set -e

# Install mise if not already installed
if ! command -v mise &>/dev/null; then
  bash "$(dirname "${BASH_SOURCE[0]}")/../terminal/mise.sh"
fi

# Install Node.js using mise
mise use -g node@20

# Create a default npm packages file if it doesn't exist
DEFAULT_PACKAGES_FILE="$HOME/.default-npm-packages"
if [ ! -f "$DEFAULT_PACKAGES_FILE" ]; then
  echo "Creating default npm packages file."
  touch "$DEFAULT_PACKAGES_FILE"
  echo "pnpm" >>"$DEFAULT_PACKAGES_FILE"
  echo "yarn" >>"$DEFAULT_PACKAGES_FILE"
fi

# Install default packages
mise reshim
