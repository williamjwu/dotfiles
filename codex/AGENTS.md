# Global Codex instructions

<!--
Machine-wide guidance for Codex, applied to every project on this machine.
Keep this for durable, personal preferences that cut across tasks.
Project-specific rules belong in that project's own AGENTS.md.
-->

## Communication
- Assume a senior engineer who knows engineering but not this codebase: skip general concepts; introduce codebase-specific names before using them.
- Lead with the conclusion. Follow with only the reasoning that changes a decision.
- One idea per sentence. No filler, hedging, preamble, or restating my message.
- Use the specific term, number, or path, never a vague stand-in.

## Topic guidance

Read the applicable file before doing the task. Resolve these paths under
`$CODEX_HOME` (default: `~/.codex`); they are explicit reading instructions,
not automatically discovered Markdown imports.

- When reading, explaining or reviewing code, a diff, a PR or a design, read `rules/explaining-code.md`.
- When preparing code changes for a PR, reviewing a PR, or drafting PR titles, descriptions or review comments, read `rules/pull-requests.md`.
- When both apply, read both. Follow more specific project and directory AGENTS.md instructions where they override these global defaults.
