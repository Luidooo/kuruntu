#!/bin/bash

# Exit on error
set -e

# Install mise if not already installed
if ! command -v mise &> /dev/null; then
  bash "$(dirname "${BASH_SOURCE[0]}")/../terminal/mise.sh"
fi

# Install PHP dependencies
sudo apt-get update
sudo apt-get install -y build-essential autoconf bison re2c \
  libxml2-dev libsqlite3-dev libssl-dev libcurl4-openssl-dev \
  pkg-config libreadline-dev libzip-dev libonig-dev

# Install PHP using mise
mise use -g php@8.3

# Install Composer
if ! command -v composer &> /dev/null; then
  curl -sS https://getcomposer.org/installer | php
  sudo mv composer.phar /usr/local/bin/composer
  sudo chmod +x /usr/local/bin/composer
fi

# Create composer global packages
composer global require laravel/installer
composer global require symfony/console
composer global require phpunit/phpunit

# Reshim to make sure PHP tools are available
mise reshim