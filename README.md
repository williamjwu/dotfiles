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
install.sh            symlink bootstrap (idempotent)
claude/               Claude Code global config (symlinked into ~/.claude/)
├── settings.json     model / theme / effort level
├── CLAUDE.md         machine-wide global instructions
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
`CLAUDE.md`, and the `commands/`, `agents/`, `skills/`, `hooks/`, `output-styles/`
directories. Because the directories are symlinked, anything you add later (a new
slash command, agent, or skill) lands in this repo automatically.

**Never tracked** (machine-local / secret / runtime — stays in `~/.claude/`):
`~/.claude.json` (account + project state), `credentials`, `settings.local.json`,
`history.jsonl`, `projects/`, `sessions/`, `cache/`, `backups/`, `plugins/`,
`shell-snapshots/`, `ide/`, `mcp-needs-auth-cache.json`. The `.gitignore` also
guards against accidentally committing secrets or `*.local.json` in the future.

> Tip: keep machine-specific permissions / MCP servers in `~/.claude/settings.local.json`
> (gitignored), not in the tracked `settings.json`.
