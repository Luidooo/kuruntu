#!/bin/bash

set -e

echo "Configuring Claude Code MCP servers (user scope)..."

claude mcp add context7 --scope user --transport stdio \
  -- npx -y @upstash/context7-mcp

claude mcp add chrome-devtools --scope user --transport stdio \
  -- npx -y chrome-devtools-mcp@latest --browserUrl http://127.0.0.1:9222

claude mcp add --scope user --transport http supabase https://mcp.supabase.com/mcp

claude mcp add --scope user --transport http atlassian https://mcp.atlassian.com/v1/mcp

claude mcp add --scope user --transport http linear https://mcp.linear.app/mcp

echo "Done. Run 'claude mcp list' to verify."
