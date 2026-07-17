#!/usr/bin/env bash
# Usage: ./install-into-project.sh [KIT_DIR] [TARGET_DIR]
set -euo pipefail
KIT_DIR="${1:-.}"
TARGET_DIR="${2:-.}"
mkdir -p "$TARGET_DIR/docs/templates" "$TARGET_DIR/data"
cp -R "$KIT_DIR/.agents" "$TARGET_DIR/"
cp -R "$KIT_DIR/docs/templates/." "$TARGET_DIR/docs/templates/"
cp "$KIT_DIR/docs/README.md" "$TARGET_DIR/docs/" 2>/dev/null || true
cp "$KIT_DIR/CHEATSHEET.md" "$TARGET_DIR/" 2>/dev/null || true
cp "$KIT_DIR/README.md" "$TARGET_DIR/KIT-README.md" 2>/dev/null || true
echo "Installed into: $(cd "$TARGET_DIR" && pwd)"
echo "Next: cp docs/templates/*.md docs/  then fill templates and open Cursor."
