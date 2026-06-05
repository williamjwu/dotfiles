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
