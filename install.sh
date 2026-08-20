#!/usr/bin/env bash
# Symlink every skill in this repo into your user-level Claude skills directory.
# Idempotent: re-run any time. Existing symlinks are replaced; real directories
# of the same name are backed up to <name>.bak rather than clobbered.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$REPO_DIR/skills"
DEST="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"

mkdir -p "$DEST"
echo "Linking skills from $SRC into $DEST"

count=0
for dir in "$SRC"/*/; do
  name="$(basename "$dir")"
  target="$DEST/$name"
  if [ -L "$target" ]; then
    rm "$target"
  elif [ -e "$target" ]; then
    echo "  ! $name is a real path, backing up to $name.bak"
    mv "$target" "$target.bak"
  fi
  ln -s "${dir%/}" "$target"
  count=$((count + 1))
done

echo "Linked $count skills."
