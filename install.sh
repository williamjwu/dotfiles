#!/usr/bin/env bash
# Idempotent dotfiles bootstrap: symlinks config from this repo into $HOME.
# Safe to re-run. Existing real files/dirs are backed up to <path>.backup.<ts>.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() { # link <source-in-repo> <target-in-home>
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [ -L "$dst" ]; then
    rm "$dst"
  elif [ -e "$dst" ]; then
    mv "$dst" "$dst.backup.$(date +%s)"
    echo "backed up existing $dst"
  fi
  ln -s "$src" "$dst"
  echo "linked $dst -> $src"
}

# Shell
link "$DOTFILES/.zshrc" "$HOME/.zshrc"
link "$DOTFILES/.vimrc" "$HOME/.vimrc"

# Claude Code global config (allowlist only)
mkdir -p "$HOME/.claude"
link "$DOTFILES/claude/settings.json"  "$HOME/.claude/settings.json"
link "$DOTFILES/claude/CLAUDE.md"      "$HOME/.claude/CLAUDE.md"
link "$DOTFILES/claude/statusline.sh"  "$HOME/.claude/statusline.sh"
for d in commands agents skills hooks output-styles; do
  link "$DOTFILES/claude/$d" "$HOME/.claude/$d"
done

echo "Done."
