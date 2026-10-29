# dotfiles

Personal config, version-controlled and installed into `$HOME`.

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

To install only selected agent configs, without changing shell or Neovim config:

```sh
./install.sh --codex
./install.sh --claude
./install.sh --codex --claude
```

Run `./install.sh --help` for usage. With no flags, all sections run as before.

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
├── rules/            topic-specific global instructions, one topic per file
└── skills/           NOT symlinked: ~/.claude/skills holds machine-local synced state
vscode/settings.json  VS Code user settings
codex/                Codex global config
├── config.toml       portable config template; installed as a local copy
├── AGENTS.md         machine-wide global instructions and topic-file reading instructions
├── agents/           custom subagents (symlinked into ~/.codex/)
├── hooks/            hook scripts (symlinked into ~/.codex/)
├── rules/            topic guidance read explicitly via AGENTS.md (symlinked into ~/.codex/)
└── skills/           global skills (symlinked into ~/.agents/)
```

## Codex config: what's tracked and why

Codex also keeps runtime state, credentials, installed plugins, and machine-specific
integrations under `~/.codex/`. This repository manages only `config.toml`,
`AGENTS.md`, and the `agents/`, `hooks/`, `rules/`, and `skills/` directories.

Model and reasoning effort are left to each session. The tracked config uses
workspace-scoped permissions with automatic approval review, and a custom profile
that denies access to `~/Documents` and `~/Dropbox`. Its alternate-screen TUI status
line shows the model, directory, remaining context, and five-hour/seven-day usage
limits. Theme is intentionally left unset. Codex global skills use the documented
`~/.agents/skills` location rather than `~/.codex/skills`.

The installer backs up an existing real `~/.codex/config.toml`, then generates a
local copy from the tracked template, expanding `~/` to the current home directory.
The config is not symlinked: app updates stay local instead of writing user paths
and runtime state into Git. Re-running the Codex installer replaces the local copy
with the template; its previous contents remain in the timestamped backup.
App-managed plugin and MCP settings are excluded from the template; restore any
needed local integrations from that backup after reinstalling. Credentials,
history, sessions, logs, and caches remain unmanaged.

Codex discovers global instructions through `~/.codex/AGENTS.md`; arbitrary
Markdown files in `rules/` are not automatically loaded. The global file tells
Codex which topic files to read for explanations and PR work. Project and nested
`AGENTS.md` files can override these defaults. Restart Codex after changing global
instructions so a new session loads them.
