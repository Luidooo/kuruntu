#!/bin/bash

# Exit on error
set -e

# Install mise if not already installed
if ! command -v mise &> /dev/null; then
  bash "$(dirname "${BASH_SOURCE[0]}")/../terminal/mise.sh"
fi

# Install .NET dependencies
sudo apt-get update
sudo apt-get install -y wget apt-transport-https

# Install .NET using mise
mise use -g dotnet@8

# Create global.json template
GLOBAL_JSON_TEMPLATE="$HOME/.global-json-template.json"
if [ ! -f "$GLOBAL_JSON_TEMPLATE" ]; then
  echo "Creating .NET global.json template."
  cat > "$GLOBAL_JSON_TEMPLATE" << 'EOF'
{
  "sdk": {
    "version": "8.0.0",
    "rollForward": "latestMajor",
    "allowPrerelease": false
  }
}
EOF
fi

# Install common .NET tools
dotnet tool install -g dotnet-ef
dotnet tool install -g dotnet-outdated-tool
dotnet tool install -g dotnet-format

# Reshim to make sure .NET tools are available
mise reshim