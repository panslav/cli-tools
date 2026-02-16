#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)"
REPO_DIR="$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd -P)"
SRC_README="$REPO_DIR/README.md"
DEFAULT_VAULT_DIR="/Users/evgeny/Library/CloudStorage/OneDrive-Personal/Documents/Рабочее/Obsidian-pro/Professional Vault"
VAULT_DIR="${CODEX_SESSION_VAULT_DIR:-$DEFAULT_VAULT_DIR}"
DEST_DIR="${CODEX_SESSION_VAULT_NOTE_DIR:-$VAULT_DIR/Projects/AI/Codex/codex-session}"
DEST_README="$DEST_DIR/readme.md"

if [ ! -f "$SRC_README" ]; then
  echo "Source README not found: $SRC_README" >&2
  exit 1
fi

mkdir -p "$DEST_DIR"
cp "$SRC_README" "$DEST_README"
