#!/bin/bash

# Exit on error
set -e

# Install mise if not already installed
if ! command -v mise &>/dev/null; then
  bash "$(dirname "${BASH_SOURCE[0]}")/../terminal/mise.sh"
fi

# Install Rust using mise
mise use -g rust@stable

# Reshim to make sure cargo is available
mise reshim
