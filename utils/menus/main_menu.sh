#!/bin/bash

set -e

# Set the install directory relative to this script
INSTALL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../../install"

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
  "IDE's")
    ides_menu
    ;;
  "Programming Languages")
    languages_menu
    ;;
  "Development Tools")
    dev_tools_menu
    ;;
  "Applications")
    applications_menu
    ;;
  "Databases")
    databases_menu
    ;;
  "Terminal tools")
    terminal_menu
    ;;
  "Exit")
    exit 0
    ;;
  esac
}

ides_menu() {
  CHOICES=$(gum choose --no-limit "VSCode (Pegadinha 😈)" "Neovim" "Vim" "IntelliJ IDEA" "Sublime Text" "Emacs" "Code-OSS" "Atom (Descontinuado)" "<- Back")

  for CHOICE in $CHOICES; do
    case "$CHOICE" in
    "VSCode (Pegadinha 😈)")
      run_install "editors/vscode"
      ;;
    "Neovim")
      run_install "editors/neovim"
      ;;
    "Vim")
      run_install "editors/vim"
      ;;
    "IntelliJ IDEA")
      run_install "editors/jetbrains-idea"
      ;;
    "Sublime Text")
      run_install "editors/sublime-text"
      ;;
    "Emacs")
      run_install "editors/emacs"
      ;;
    "Code-OSS")
      run_install "editors/code-oss"
      ;;
    "Atom (Descontinuado)")
      run_install "editors/atom"
      ;;
    "<- Back")
      main_menu
      return
      ;;
    esac
  done
  main_menu
}

languages_menu() {
  CHOICES=$(gum choose --no-limit "Ruby" "Node" "Rust" "Python" "Go" "Java" "PHP" "Swift" "TypeScript" ".NET" "<- Back")

  for CHOICE in $CHOICES; do
    case "$CHOICE" in
    "Ruby")
      run_install "languages/ruby"
      ;;
    "Node")
      run_install "languages/node"
      ;;
    "Rust")
      run_install "languages/rust"
      ;;
    "Python")
      run_install "languages/python"
      ;;
    "Go")
      run_install "languages/golang"
      ;;
    "Java")
      run_install "languages/java"
      ;;
    "PHP")
      run_install "languages/php"
      ;;
    "Swift")
      run_install "languages/swift"
      ;;
    "TypeScript")
      run_install "languages/typescript"
      ;;
    ".NET")
      run_install "languages/dotnet"
      ;;
    "<- Back")
      main_menu
      return
      ;;
    esac
  done
  main_menu
}

dev_tools_menu() {
  CHOICES=$(gum choose --no-limit "Docker" "Git" "<- Back")

  for CHOICE in $CHOICES; do
    case "$CHOICE" in
    "Docker")
      run_install "development/docker"
      ;;
    "Git")
      print "INFO" "Git is usually pre-installed. Try: git --version"
      ;;
    "<- Back")
      main_menu
      return
      ;;
    esac
  done
  main_menu
}

applications_menu() {
  CHOICES=$(gum choose --no-limit "Chrome" "Hyprland" "<- Back")

  for CHOICE in $CHOICES; do
    case "$CHOICE" in
    "Chrome")
      run_install "applications/chrome"
      ;;
    "Hyprland")
      run_install "applications/hyrland"
      ;;
    "<- Back")
      main_menu
      return
      ;;
    esac
  done
  main_menu
}

terminal_menu() {
  CHOICES=$(gum choose --no-limit "Bash" "Btop" "Fonts" "Mise" "Nerd Icons" "Zellij" "<- Back")

  for CHOICE in $CHOICES; do
    case "$CHOICE" in
    "Bash")
      run_install "terminal/bash"
      ;;
    "Btop")
      run_install "terminal/btop"
      ;;
    "Fonts")
      run_install "terminal/fonts"
      ;;
    "Mise")
      run_install "terminal/mise"
      ;;
    "Nerd Icons")
      run_install "terminal/nerd-icons"
      ;;
    "Zellij")
      run_install "terminal/zellij"
      ;;
    "<- Back")
      main_menu
      return
      ;;
    esac
  done
  main_menu
}

databases_menu() {
  CHOICES=$(gum choose --no-limit "MySQL" "PostgreSQL" "Redis" "<- Back")

  for CHOICE in $CHOICES; do
    case "$CHOICE" in
    "MySQL")
      print "INFO" "MySQL installation not implemented yet"
      ;;
    "PostgreSQL")
      print "INFO" "PostgreSQL installation not implemented yet"
      ;;
    "Redis")
      print "INFO" "Redis installation not implemented yet"
      ;;
    "<- Back")
      main_menu
      return
      ;;
    esac
  done
  main_menu
}

# Check if gum is available
if ! command -v gum &>/dev/null; then
  print "ERROR" "gum is required but not installed. Please install gum first:"
  echo "  https://github.com/charmbracelet/gum#installation"
  exit 1
fi

main_menu
