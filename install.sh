#!/usr/bin/env bash
# One-line installer for the Claude Code skills pack.
# Usage: bash <(curl -s <PASTE_URL_AFTER_HOSTING>)  -- or run locally:
#   bash install.sh ~/.claude/skills

set -euo pipefail

TARGET="${1:-${HOME}/.claude/skills}"
SRC="$(cd "$(dirname "$0")" && pwd)/skills"

echo "Installing skills pack -> $TARGET"
mkdir -p "$TARGET"
for skill in "$SRC"/*/; do
    name="$(basename "$skill")"
    cp -R "$skill" "$TARGET/$name"
    echo "  installed: $name"
done

echo
echo "Done. Verify with:"
echo "  ls $TARGET"
echo "Then in Claude Code, invoke: /git-surgery, /api-debugger, /test-doctor"
echo
echo "Note: Claude Code discovers skills from ~/.claude/skills on startup;"
echo "restart the session if they don't show up immediately."