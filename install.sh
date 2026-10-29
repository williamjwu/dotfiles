#!/usr/bin/env bash
# Dotfiles bootstrap: links instructions and installs a local Codex config.
# Safe to re-run. Existing real files/dirs are backed up to <path>.backup.<ts>.
set -euo pipefail

usage() {
  cat <<'EOF'
Usage: ./install.sh [--codex] [--claude] [--help]

With no flags, install shell, Neovim, and both available agent configs.
With selection flags, install only the selected agent configs:
  --codex         Install Codex config
  --claude        Install Claude Code config
  --codex --claude Install both agent configs
  -h, --help      Show this help

Agent configs are skipped if their CLI is not on PATH.
EOF
}

install_codex=false
install_claude=false
install_shell=false
if [ "$#" -eq 0 ]; then
  install_codex=true
  install_claude=true
  install_shell=true
fi
for arg in "$@"; do
  case "$arg" in
    --codex) install_codex=true ;;
    --claude) install_claude=true ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown option: $arg" >&2; usage >&2; exit 1 ;;
  esac
done

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

# Render a local copy so app-managed changes never modify the tracked template.
install_codex_config() {
  local dst="$HOME/.codex/config.toml" line
  if [ -L "$dst" ]; then
    rm "$dst"
  elif [ -e "$dst" ]; then
    mv "$dst" "$dst.backup.$(date +%s)"
    echo "backed up existing $dst"
  fi
  while IFS= read -r line || [ -n "$line" ]; do
    printf '%s\n' "${line//\~\//$HOME/}"
  done < "$DOTFILES/codex/config.toml" > "$dst"
  echo "generated $dst from Codex config template"
}

if "$install_shell"; then
  # Shell
  link "$DOTFILES/.zshrc" "$HOME/.zshrc"
  link "$DOTFILES/.vimrc" "$HOME/.vimrc"

  # Neovim (init.lua lives under $XDG_CONFIG_HOME/nvim, default ~/.config/nvim)
  link "$DOTFILES/nvim/init.lua" "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/init.lua"
fi

# Claude Code global config (allowlist only) -- skipped unless `claude` is installed
if "$install_claude"; then
  if command -v claude >/dev/null 2>&1; then
    mkdir -p "$HOME/.claude"
    link "$DOTFILES/claude/CLAUDE.md"     "$HOME/.claude/CLAUDE.md"
    link "$DOTFILES/claude/settings.json" "$HOME/.claude/settings.json"
    link "$DOTFILES/claude/statusline.sh" "$HOME/.claude/statusline.sh"
    # skills/ is deliberately not linked: ~/.claude/skills holds Claude-managed
    # synced state (skills/synced/), which must stay machine-local.
    for d in agents commands hooks output-styles rules; do
      link "$DOTFILES/claude/$d" "$HOME/.claude/$d"
    done
  else
    echo "skipping Claude Code config (claude not installed)"
  fi
fi

# Codex global config (allowlist only) -- skipped unless `codex` is installed
if "$install_codex"; then
  if command -v codex >/dev/null 2>&1; then
    mkdir -p "$HOME/.codex" "$HOME/.agents"
    install_codex_config
    link "$DOTFILES/codex/AGENTS.md"   "$HOME/.codex/AGENTS.md"
    for d in agents hooks rules; do
      link "$DOTFILES/codex/$d" "$HOME/.codex/$d"
    done
    link "$DOTFILES/codex/skills" "$HOME/.agents/skills"
  else
    echo "skipping Codex config (codex not installed)"
  fi
fi

echo "Done."
