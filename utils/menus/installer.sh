#!/bin/bash

set -e

INSTALL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../install"

# Function to print messages
print() {
  local GREEN='\033[0;32m'
  local YELLOW='\033[1;33m'
  local RED='\033[0;31m'
  local NO_COLOR='\033[0m'
  local MESSAGE=$2
  local STATUS=$1

  case $STATUS in
  "SUCCESS")
    echo -e "${GREEN}=======================================================${NO_COLOR}"
    echo -e "${GREEN}[SUCCESS] - $MESSAGE!${NO_COLOR}"
    echo -e "${GREEN}=======================================================${NO_COLOR}"
    ;;
  "ERROR")
    echo -e "${RED}=======================================================${NO_COLOR}"
    echo -e "${RED}[ERROR] - $MESSAGE${NO_COLOR}"
    echo -e "${RED}=======================================================${NO_COLOR}"
    ;;
  "INFO")
    echo "======================================================="
    echo -e "[INFO] - $MESSAGE"
    echo "======================================================="
    ;;
  esac
}

# Function to run install scripts
run_install() {
  local script_name=$1
  local script_path="$INSTALL_DIR/$script_name.sh"

  if [ -f "$script_path" ]; then
    print "INFO" "Running $script_name"
    bash "$script_path"
    if [ $? -eq 0 ]; then
      print "SUCCESS" "$script_name"
    else
      print "ERROR" "Failed to run $script_name"
      exit 1
    fi
  else
    print "ERROR" "Installation script for $script_name not found"
  fi
}

main_menu() {
  CHOICE=$(gum choose "IDE's" "Programming Languages" "Development Tools" "Applications" "Databases" "Terminal tools" "Exit")

  case "$CHOICE" in
  "Editors")
    ides_menu
    ;;
  "Programming Languages")
    languages_menu
    ;;
  "Web Development Tools")
    web_tools_menu
    ;;
  "Databases")
    databases_menu
    ;;
  "Exit")
    exit 0
    ;;
  esac
}

editors_menu() {
  CHOICES=$(gum choose --no-limit "Neovim" "Vim" "<- Back" \
    --selected "Neovim,Vim")

  for CHOICE in $CHOICES; do
    case "$CHOICE" in
    "Neovim")
      run_install "editors/neovim"
      ;;
    "Vim")
      run_install "editors/vim"
      ;;
    "Vscode")
      #run_install "editors/vscode"
      echo "kkkkkkkkkkkkkkkkk acho que tinha é, vai aprender a usar o vim meu fi"
      ;;
    "<- Back")
      main_menu
      ;;
    esac
  done
  main_menu
}

languages_menu() {
  CHOICES=$(gum choose --no-limit "Python" "Java" "TypeScript" "C#/.NET" "PHP" "Go" "Swift" "Ruby" "Node" "Rust" "<- Back")

  for CHOICE in $CHOICES; do
    case "$CHOICE" in
    "Python")
      run_install "languages/python"
      ;;
    "Java")
      run_install "languages/java"
      ;;
    "TypeScript")
      run_install "languages/typescript"
      ;;
    "C#/.NET")
      run_install "languages/dotnet"
      ;;
    "PHP")
      run_install "languages/php"
      ;;
    "Go")
      run_install "languages/golang"
      ;;
    "Swift")
      run_install "languages/swift"
      ;;
    "Ruby")
      run_install "languages/ruby"
      ;;
    "Node")
      run_install "languages/node"
      ;;
    "Rust")
      run_install "languages/rust"
      ;;
    "<- Back")
      main_menu
      ;;
    esac
  done
  main_menu
}

web_tools_menu() {
  CHOICES=$(gum choose --no-limit "Docker" "Postman" "Back")

  for CHOICE in $CHOICES; do
    case "$CHOICE" in
    "Docker")
      run_install "web/docker"
      ;;
    "Postman")
      run_install "web/postman"
      ;;
    "<- Back")
      main_menu
      ;;
    esac
  done
  main_menu
}

databases_menu() {
  CHOICES=$(gum choose --no-limit "MySQL" "PostgreSQL" "Redis" "Back")

  for CHOICE in $CHOICES; do
    case "$CHOICE" in
    "MySQL")
      run_install "databases/mysql"
      ;;
    "PostgreSQL")
      run_install "databases/postgresql"
      ;;
    "Redis")
      run_install "databases/redis"
      ;;
    "<- Back")
      main_menu
      ;;
    esac
  done
  main_menu
}

bash "$INSTALL_DIR/../utils/required/gum.sh"

main_menu
