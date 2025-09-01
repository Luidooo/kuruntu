#!/bin/bash

# Exit on error
set -e

# Install Node.js first if not already installed
if ! command -v node &>/dev/null; then
  bash "$(dirname "${BASH_SOURCE[0]}")/node.sh"
fi

# Install TypeScript globally
npm install -g typescript

# Install TypeScript related tools
npm install -g ts-node
npm install -g tsx
npm install -g @types/node
npm install -g eslint
npm install -g prettier

# Create tsconfig.json template
TSCONFIG_TEMPLATE="$HOME/.tsconfig-template.json"
if [ ! -f "$TSCONFIG_TEMPLATE" ]; then
  echo "Creating TypeScript config template."
  cat >"$TSCONFIG_TEMPLATE" <<'EOF'
{
  "compilerOptions": {
    "target": "ES2020",
    "module": "commonjs",
    "lib": ["ES2020"],
    "outDir": "./dist",
    "rootDir": "./src",
    "strict": true,
    "esModuleInterop": true,
    "skipLibCheck": true,
    "forceConsistentCasingInFileNames": true,
    "declaration": true,
    "declarationMap": true,
    "sourceMap": true
  },
  "include": ["src/**/*"],
  "exclude": ["node_modules", "dist"]
}
EOF
fi

