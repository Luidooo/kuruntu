#!/bin/bash

# Exit on error
set -e

# Install mise if not already installed
if ! command -v mise &> /dev/null; then
  bash "$(dirname "${BASH_SOURCE[0]}")/../terminal/mise.sh"
fi

# Install Go using mise
mise use -g golang@1.21

# Create GOPATH directory if it doesn't exist
GOPATH="$HOME/go"
if [ ! -d "$GOPATH" ]; then
  mkdir -p "$GOPATH"/{bin,src,pkg}
fi

# Install common Go tools
go install golang.org/x/tools/gopls@latest
go install github.com/go-delve/delve/cmd/dlv@latest
go install honnef.co/go/tools/cmd/staticcheck@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go install github.com/air-verse/air@latest

# Reshim to make sure Go tools are available
mise reshim