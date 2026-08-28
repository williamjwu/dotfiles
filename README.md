# dotfiles

Personal config, version-controlled and symlinked into `$HOME`.

## Setup on a new machine

```sh
git clone git@github.com:williamjwu/dotfiles.git ~/workspace/dotfiles
cd ~/workspace/dotfiles
./install.sh
```

`install.sh` is idempotent: re-running it is safe, and any existing real file it
would replace is backed up to `<path>.backup.<timestamp>` first.

## Layout

```
.zshrc, .vimrc        shell config
nvim/init.lua         Neovim config (symlinked into ~/.config/nvim/)
install.sh            symlink bootstrap (idempotent)
claude/               Claude Code global config (symlinked into ~/.claude/)
├── settings.json     model / theme / effort level / status line
├── CLAUDE.md         machine-wide global instructions
├── statusline.sh     status line: model:effort · context % · usage limits
├── commands/         custom slash commands
├── agents/           custom subagents
├── skills/           custom skills
├── hooks/            tool-call hooks
└── output-styles/    output styles
codex/                Codex global config
├── config.toml       model / reasoning / permissions / TUI status line
├── AGENTS.md         machine-wide global instructions
├── agents/           custom subagents (symlinked into ~/.codex/)
├── hooks/            hook scripts (symlinked into ~/.codex/)
└── skills/           global skills (symlinked into ~/.agents/)
```

## Claude config: what's tracked and why

Claude writes a lot of **runtime state and secrets** into `~/.claude/` and
`~/.claude.json`. Only an explicit *allowlist* of config files is version-controlled
here; everything else is left in place and never enters the repo.

**Tracked** (symlinked from `claude/` into `~/.claude/`): `settings.json`,
`CLAUDE.md`, `statusline.sh`, and the `commands/`, `agents/`, `skills/`, `hooks/`,
`output-styles/` directories. Because the directories are symlinked, anything you
add later (a new slash command, agent, or skill) lands in this repo automatically.

The status line (`settings.json` → `statusLine` → `~/.claude/statusline.sh`) is
built only from fields documented in the official Claude Code statusline reference
(https://code.claude.com/docs/en/statusline): `model.display_name`, `effort.level`,
`context_window.used_percentage`, and `rate_limits.{five_hour,seven_day}`. Colors
use 256-color codes tuned to Claude's clay palette for a dark terminal.

**Never tracked** (machine-local / secret / runtime — stays in `~/.claude/`):
`~/.claude.json` (account + project state), `credentials`, `settings.local.json`,
`history.jsonl`, `projects/`, `sessions/`, `cache/`, `backups/`, `plugins/`,
`shell-snapshots/`, `ide/`, `mcp-needs-auth-cache.json`. The `.gitignore` also
guards against accidentally committing secrets or `*.local.json` in the future.

> Tip: keep machine-specific permissions / MCP servers in `~/.claude/settings.local.json`
> (gitignored), not in the tracked `settings.json`.

## Codex config: what's tracked and why

Codex also keeps runtime state, credentials, installed plugins, and machine-specific
integrations under `~/.codex/`. This repository manages only `config.toml`,
`AGENTS.md`, and the `agents/`, `hooks/`, and `skills/` extension directories.

The tracked config uses `gpt-5.6-sol` with medium reasoning, workspace-scoped
permissions with automatic approval review, alternate-screen TUI mode, and a
built-in status line. Theme is intentionally left unset. Codex global skills use
the documented `~/.agents/skills` location rather than `~/.codex/skills`.

The installer backs up an existing real `~/.codex/config.toml` before linking the
portable tracked config. Account credentials, history, sessions, logs, caches,
plugins, MCP integrations, and other machine-local state remain unmanaged.
