#!/bin/bash

###installing the most useful tools
ERROR="-1"
SUCESS="0"
INFO="1"

DOTFILES="$HOME$USER/.config/dotfiles/"
CONFIG_DIR="$HOME$USER/.config/"

print() {
  local GREEN='\033[0;32m'
  local YELLOW='\033[1;33m'
  local RED='\033[0;31m'
  local NO_COLOR='\033[0m'

  if [ $1 -eq "$ERROR" ]; then
    echo -e "${RED}$2${NO_COLOR}"

  else
    if [ $1 -eq "$SUCESS" ]; then
      echo -e "${GREEN}$2${NO_COLOR}"

    else
      echo -e "$2"

    fi
  fi
}

clone_dotfiles() {
  rm -rf $DOTFILES
  git clone https://github.com/Luidooo/dotfiles.git $DOTFILES
}

docker() {
  sudo install -m 0755 -d /etc/apt/keyrings
  sudo wget -qO /etc/apt/keyrings/docker.asc https://download.docker.com/linux/ubuntu/gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
  sudo apt update
  sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
  sudo usermod -aG docker ${USER}
}

#virtualization() {
#TODO: set kvm, qemu e virsh
#TODO: maybe install some famous isos two
#}

install_nvim() {
  sudo snap install neovim --classic
  rm -rf "$CONFIG_DIR/nvim"
  cp -r "$DOTFILES/nvim/" "$CONFIG_DIR/nvim/"

}

#install_vim() {
#  sudo apt install vim -y
#
#}

#config_ssh() {
#
#}

utilities() {
  sudo apt install -y
  tree
  unzip
  git
  curl
  figlet
  cmatrix

}

main() {
  print $ERROR "ai toma"
  print $SUCESS "ai toma"
  print $INFO "ai toma"
}

main
