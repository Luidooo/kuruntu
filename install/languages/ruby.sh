#!/bin/bash

# Exit on error
set -e

# Install mise if not already installed
if ! command -v mise &> /dev/null; then
  bash "$(dirname "${BASH_SOURCE[0]}")/../mise.sh"
fi

# Install ruby-build dependencies
sudo apt-get update
sudo apt-get install -y autoconf patch build-essential rustc libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev libffi-dev libgdbm-dev libdb-dev uuid-dev

# Install Ruby using mise
mise use -g ruby@3.2

# Create a default gems file if it doesn't exist
DEFAULT_GEMS_FILE="$HOME/.default-gems"
if [ ! -f "$DEFAULT_GEMS_FILE" ]; then
  echo "Creating default gems file."
  touch "$DEFAULT_GEMS_FILE"
  echo "bundler" >> "$DEFAULT_GEMS_FILE"
  echo "rails" >> "$DEFAULT_GEMS_FILE"
fi

# Install default gems
mise reshim
