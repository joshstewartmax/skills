#!/usr/bin/env bash
# Symlink every skill in this repo into your user-level Claude skills directory.
# A skill is any top-level directory containing a SKILL.md (so licenses/ etc. are skipped).
# Idempotent: re-run any time. Existing symlinks are replaced; real directories
# of the same name are backed up to <name>.bak rather than clobbered.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
AGENTS_DEST="${CLAUDE_AGENTS_DIR:-$HOME/.claude/agents}"

link() {
  # link <source-path> <target-path>: replace symlinks, back up real paths
  local src="$1" target="$2" name
  name="$(basename "$target")"
  if [ -L "$target" ]; then
    rm "$target"
  elif [ -e "$target" ]; then
    echo "  ! $name is a real path, backing up to $name.bak"
    mv "$target" "$target.bak"
  fi
  ln -s "$src" "$target"
}

mkdir -p "$DEST"
echo "Linking skills from $REPO_DIR into $DEST"
count=0
for dir in "$REPO_DIR"/*/; do
  [ -f "$dir/SKILL.md" ] || continue
  link "${dir%/}" "$DEST/$(basename "$dir")"
  count=$((count + 1))
done
echo "Linked $count skills."

if [ -d "$REPO_DIR/agents" ]; then
  mkdir -p "$AGENTS_DEST"
  echo "Linking agents from $REPO_DIR/agents into $AGENTS_DEST"
  acount=0
  for f in "$REPO_DIR"/agents/*.md; do
    [ -e "$f" ] || continue
    link "$f" "$AGENTS_DEST/$(basename "$f")"
    acount=$((acount + 1))
  done
  echo "Linked $acount agents."
fi
