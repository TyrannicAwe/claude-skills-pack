#!/usr/bin/env bash
# One-line installer for the Claude Code skills pack.
#   bash <(curl -s https://raw.githubusercontent.com/TyrannicAwe/claude-skills-pack/main/install.sh)
#   or locally: bash install.sh ~/.claude/skills
set -euo pipefail

TARGET="${1:-${HOME}/.claude/skills}"
REPO_URL="https://github.com/TyrannicAwe/claude-skills-pack/archive/refs/heads/main.tar.gz"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

echo "Installing Claude Code Skills Pack -> $TARGET"
mkdir -p "$TARGET"

SRC="$(cd "$(dirname "$0")" 2>/dev/null && pwd)/skills"
if [ -d "$SRC" ]; then
    echo "Using local files ($SRC)"
    cp -R "$SRC"/. "$TARGET"/
else
    echo "Downloading from $REPO_URL"
    curl -fsSL "$REPO_URL" -o "$TMP/pack.tar.gz"
    tar -xzf "$TMP/pack.tar.gz" -C "$TMP"
    cp -R "$TMP"/claude-skills-pack-main/skills/. "$TARGET"/
fi

echo
echo "Installed:"
ls "$TARGET"
echo
echo "Restart Claude Code, then invoke: /git-surgery, /api-debugger, /test-doctor"