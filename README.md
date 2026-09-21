# dotfiles

Personal config, version-controlled and symlinked into `$HOME`.

## Setup on a new machine

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install neovim
git clone git@github.com:williamjwu/dotfiles.git ~/workspace/dotfiles
cd ~/workspace/dotfiles
./install.sh
```

`install.sh` is idempotent: re-running it is safe, and any existing real file it
would replace is backed up to `<path>.backup.<timestamp>` first. The Claude Code
and Codex sections each run only if the matching CLI (`claude` / `codex`) is on
`PATH`, so the script is safe on a machine that has only one of them.

Homebrew is a prerequisite, not managed here: follow the installer's "Next steps" to
add `brew shellenv` to `~/.zprofile`. `.zshrc` aliases `vi`/`vim` to `nvim`.

## Layout

```
.zshrc, .vimrc        shell config
nvim/init.lua         Neovim config (symlinked into ~/.config/nvim/)
install.sh            shell / Neovim / Claude Code / Codex symlink bootstrap (idempotent)
claude/               Claude Code global config (symlinked into ~/.claude/)
├── settings.json     permissions / model / effort / status line / iTerm2 hooks
├── CLAUDE.md         machine-wide global instructions
├── statusline.sh     status line script referenced by settings.json
├── agents/           custom subagents
├── commands/         slash commands
├── hooks/            hook scripts
├── output-styles/    output styles
└── skills/           NOT symlinked: ~/.claude/skills holds machine-local synced state
codex/                Codex global config
├── config.toml       model / reasoning / permissions / TUI status line
├── AGENTS.md         machine-wide global instructions
├── agents/           custom subagents (symlinked into ~/.codex/)
├── hooks/            hook scripts (symlinked into ~/.codex/)
└── skills/           global skills (symlinked into ~/.agents/)
```

## Codex config: what's tracked and why

Codex also keeps runtime state, credentials, installed plugins, and machine-specific
integrations under `~/.codex/`. This repository manages only `config.toml`,
`AGENTS.md`, and the `agents/`, `hooks/`, and `skills/` extension directories.

The tracked config uses `gpt-5.6-sol` with its default medium reasoning,
workspace-scoped permissions with automatic approval review, and a custom profile
that denies access to `~/Documents` and `~/Dropbox`. Its alternate-screen TUI status
line shows the model, directory, remaining context, and five-hour/seven-day usage
limits. Theme is intentionally left unset. Codex global skills use the documented
`~/.agents/skills` location rather than `~/.codex/skills`.

The installer backs up an existing real `~/.codex/config.toml` before linking the
portable tracked config. Account credentials, history, sessions, logs, caches,
plugins, MCP integrations, and other machine-local state remain unmanaged.
