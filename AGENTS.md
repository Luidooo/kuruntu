# AGENTS.md

This file provides guidelines for agentic coding agents operating in this repository.

## Build, Lint, and Test Commands

- **Build:** There is no traditional build step. The main entry point for installation is `init.sh`.
- **Lint:**
  - Lua: `stylua --check .`
  - Ruby: `rubocop`
  - Shell: `shellcheck` (inferred)
- **Test:** There is no configured testing framework.

## Code Style Guidelines

- **Formatting:**
  - Lua: 2 spaces for indentation, 120 columns width.
  - Ruby: Follow standard `rubocop` conventions.
- **Imports:** Keep imports at the top of the file.
- **Types:** This project does not use a static type checker.
- **Naming Conventions:** Follow standard conventions for each language (e.g., snake_case for Ruby and shell, camelCase for Lua).
- **Error Handling:** Check for errors and provide clear error messages. For shell scripts, use `set -e` to exit on error.
