#!/bin/bash

set -e

KURUNTU_PATH="$HOME/.local/share/kuruntu"

curl -fsSL https://www.anthropic.com/claude-code/install.sh | bash

echo "Claude code installed with sucess"

if [ "$1" = "mcp" ]; then
  bash $KURUNTU_PATH/dots/claude/mcp.sh 2>&1 | tee "/tmp/run_claude_mcp.log"
else
  echo "Wanna to settting up the mcps?"
  echo "run \"KURUNTU_PATH/dots/claude/mcp.sh\""
fi
