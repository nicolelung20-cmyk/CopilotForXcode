#!/bin/bash
set -euo pipefail

# Only run in Claude Code on the web.
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

# The Swift packages (Core, Tool) and the Xcode project need macOS/Xcode and
# cannot be built here. Only the Node/TypeScript webview bundle in Server/ can.
# The darwin-only copilot-language-server packages fail the platform check on
# Linux, so npm is told to ignore engine/os restrictions for this install.
cd "$CLAUDE_PROJECT_DIR/Server"
npm install --no-audit --no-fund --force
