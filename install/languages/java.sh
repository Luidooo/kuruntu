#!/bin/bash

# Exit on error
set -e

# Install mise if not already installed
if ! command -v mise &> /dev/null; then
  bash "$(dirname "${BASH_SOURCE[0]}")/../terminal/mise.sh"
fi

# Install Java dependencies
sudo apt-get update
sudo apt-get install -y build-essential unzip

# Install Java using mise
mise use -g java@21

# Install Maven
sudo apt-get install -y maven

# Install Gradle
if ! command -v gradle &> /dev/null; then
  wget -O gradle.zip https://services.gradle.org/distributions/gradle-8.5-bin.zip
  sudo unzip -d /opt gradle.zip
  sudo ln -sf /opt/gradle-8.5/bin/gradle /usr/local/bin/gradle
  rm gradle.zip
fi

# Reshim to make sure Java tools are available
mise reshim