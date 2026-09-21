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
link "$DOTFILES/.zprofile" "$HOME/.zprofile"
link "$DOTFILES/.zshrc"    "$HOME/.zshrc"
link "$DOTFILES/.vimrc" "$HOME/.vimrc"

# Neovim (init.lua lives under $XDG_CONFIG_HOME/nvim, default ~/.config/nvim)
link "$DOTFILES/nvim/init.lua" "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/init.lua"

# Claude Code global config (allowlist only) -- skipped unless `claude` is installed
if command -v claude >/dev/null 2>&1; then
  mkdir -p "$HOME/.claude"
  link "$DOTFILES/claude/CLAUDE.md"     "$HOME/.claude/CLAUDE.md"
  link "$DOTFILES/claude/settings.json" "$HOME/.claude/settings.json"
  link "$DOTFILES/claude/statusline.sh" "$HOME/.claude/statusline.sh"
  # skills/ is deliberately not linked: ~/.claude/skills holds Claude-managed
  # synced state (skills/synced/), which must stay machine-local.
  for d in agents commands hooks output-styles; do
    link "$DOTFILES/claude/$d" "$HOME/.claude/$d"
  done
else
  echo "skipping Claude Code config (claude not installed)"
fi

# Codex global config (allowlist only) -- skipped unless `codex` is installed
if command -v codex >/dev/null 2>&1; then
  mkdir -p "$HOME/.codex" "$HOME/.agents"
  link "$DOTFILES/codex/config.toml" "$HOME/.codex/config.toml"
  link "$DOTFILES/codex/AGENTS.md"   "$HOME/.codex/AGENTS.md"
  for d in agents hooks; do
    link "$DOTFILES/codex/$d" "$HOME/.codex/$d"
  done
  link "$DOTFILES/codex/skills" "$HOME/.agents/skills"
else
  echo "skipping Codex config (codex not installed)"
fi

echo "Done."
