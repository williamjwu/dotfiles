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

# Neovim (init.lua lives under $XDG_CONFIG_HOME/nvim, default ~/.config/nvim)
link "$DOTFILES/nvim/init.lua" "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/init.lua"

# Codex global config (allowlist only)
mkdir -p "$HOME/.codex" "$HOME/.agents"
link "$DOTFILES/codex/config.toml" "$HOME/.codex/config.toml"
link "$DOTFILES/codex/AGENTS.md"   "$HOME/.codex/AGENTS.md"
for d in agents hooks; do
  link "$DOTFILES/codex/$d" "$HOME/.codex/$d"
done
link "$DOTFILES/codex/skills" "$HOME/.agents/skills"

echo "Done."
