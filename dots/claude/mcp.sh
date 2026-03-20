#!/bin/bash

set -e

echo "Configuring Claude Code MCP servers (user scope)..."

# context7 — up-to-date docs for any library
claude mcp add context7 --scope user \
  --transport stdio \
  -- npx -y @upstash/context7-mcp

# chrome-devtools — browser automation
claude mcp add chrome-devtools --scope user \
  --transport stdio \
  -- npx -y chrome-devtools-mcp@latest --browserUrl http://127.0.0.1:9222

echo "Done. Run 'claude mcp list' to verify."
