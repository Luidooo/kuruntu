#!/bin/bash

# Exit on error
set -e

# Install mise if not already installed
if ! command -v mise &> /dev/null; then
  bash "$(dirname "${BASH_SOURCE[0]}")/../terminal/mise.sh"
fi

# Install Python dependencies
sudo apt-get update
sudo apt-get install -y build-essential libssl-dev zlib1g-dev \
  libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
  libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev \
  liblzma-dev python3-openssl git

# Install Python using mise
mise use -g python@3.12

# Create a default pip packages file if it doesn't exist
DEFAULT_PACKAGES_FILE="$HOME/.default-python-packages"
if [ ! -f "$DEFAULT_PACKAGES_FILE" ]; then
  echo "Creating default Python packages file."
  touch "$DEFAULT_PACKAGES_FILE"
  echo "pip" >> "$DEFAULT_PACKAGES_FILE"
  echo "setuptools" >> "$DEFAULT_PACKAGES_FILE"
  echo "wheel" >> "$DEFAULT_PACKAGES_FILE"
  echo "pipenv" >> "$DEFAULT_PACKAGES_FILE"
  echo "poetry" >> "$DEFAULT_PACKAGES_FILE"
  echo "virtualenv" >> "$DEFAULT_PACKAGES_FILE"
  echo "black" >> "$DEFAULT_PACKAGES_FILE"
  echo "flake8" >> "$DEFAULT_PACKAGES_FILE"
  echo "pytest" >> "$DEFAULT_PACKAGES_FILE"
  echo "requests" >> "$DEFAULT_PACKAGES_FILE"
fi

# Install default packages
mise reshim