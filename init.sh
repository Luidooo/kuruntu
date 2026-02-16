#!/bin/bash

set -e

sudo apt update -y
sudo apt upgrade -y
sudo apt install -y curl git

export KURUNTU_PATH="$HOME/.local/share/kuruntu"
REPO_URL="https://github.com/luidooo/kuruntu.git"

if [ -d "$KURUNTU_PATH" ]; then
  echo "Kuruntu directory already exists. Pulling latest changes."
  cd $KURUNTU_PATH
else
  echo "Cloning dotfiles repository."
  sudo git clone $REPO_URL $KURUNTU_PATH
fi
