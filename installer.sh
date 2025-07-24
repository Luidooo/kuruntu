#!/bin/bash
ERROR="-1"
SUCESS="0"
INFO="1"
LINE="======================================================="

DOTFILES="$HOME/.config/dotfiles/"
CONFIG_DIR="$HOME/.config/"
GH_USER="Luidooo"

print() {
  local GREEN='\033[0;32m'
  local YELLOW='\033[1;33m'
  local RED='\033[0;31m'
  local NO_COLOR='\033[0m'

  if [ $1 -eq "$ERROR" ]; then
    echo -e "${RED}$LINE${NO_COLOR}"
    echo -e "${RED}[ERROR] - $2${NO_COLOR}"
    echo -e "${RED}$LINE${NO_COLOR}"

  else
    if [ $1 -eq "$SUCESS" ]; then
      echo -e "${GREEN}$LINE${NO_COLOR}"
      echo -e "${GREEN}[SUCESS] - $2!${NO_COLOR}"
      echo -e "${GREEN}$LINE${NO_COLOR}"

    else
      echo $LINE
      echo -e "[INFO] - Setting $2!"
      echo $LINE

    fi
  fi
}

verify() {
  if [ $? -eq 0 ]; then
    print $SUCESS "$1"
  else
    print $ERROR "Error! See the last [INFO] for more information!"
    echo $2
  fi

}

clone_dotfiles() {
  print $INFO "Cloning the $GH_USER dotfiles from github..."
  rm -rf $DOTFILES
  git clone "https://github.com/$GH_USER/dotfiles.git" $DOTFILES
  verify "Dotfiles"
}

docker() {
  print $INFO "Docker"
  sudo install -m 0755 -d /etc/apt/keyrings
  sudo wget -qO /etc/apt/keyrings/docker.asc https://download.docker.com/linux/ubuntu/gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
  sudo apt update
  sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
  sudo usermod -aG docker ${USER}
  verify "Docker"

}

#virtualization() {
#TODO: set kvm, qemu e virsh
#TODO: maybe install some famous isos two
#}

install_nvim() {
  print $INFO "Neovim"
  sudo snap install neovim --classic
  rm -rf "$CONFIG_DIR/nvim"
  cp -r "$DOTFILES/nvim/" "$CONFIG_DIR/nvim/"
  verify "Neovim"
}

install_vim() {
  sudo apt install vim -y

}

#config_ssh() {
#
#}

utilities() {
  print "Starting to dowload the most useful packages (utiiles) "
  sudo apt install -y
  tree
  unzip
  git
  curl
  figlet
  cmatrix
  verify "Utilities downloaded!"

}

setting_ssh() {
  print "Setting the ssh utilities"
  sudo apt install -y ssh
  ssh keygen
}

main() {
  sudo apt update -Y
  sudo apt upgrade -Y
  utilities
  clone_dotfiles
}

main
