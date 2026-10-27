# Pull requests

## Scope
- One atomic change per PR: the core change plus its tests. Unrelated configs, personal or experimental scripts and drive-by cleanups go in separate PRs; point them out and offer to split. Small example or showcase code is fine.
- Over ~1000 LOC changed needs splitting by what can land independently. If the split is unclear, ask me.
- Refactor first, then add the feature, in separate PRs. For large work, prefer small PRs that land on main early (even if unused for a while) over long stacks.
- Once review has started, don't force-push.

## Code cleanup
- Comments explain *why* (rationale, invariants, non-obvious edge cases), never *what*, unless the directory's own AGENTS.md sets a different comment style; then follow that file. No project history ("previously X", "fix for bug Y"). Delete comments that restate names, narrate control flow, repeat assertions or read like a design doc.
- Docstrings: public ones state the contract; private ones are rare and short, deleted if name + types already explain it. Tests use descriptive names instead of docstrings.
- Delete no-op `super()` overrides, type guards on already-typed internal data, redundant coercions and provably dead branches. Keep user-facing validation and raises/asserts that prevent silent data corruption. When removing a guard, grep for comments that mention it.
- Prefer `assert`/`raise` over `# type: ignore` / `# noqa` / `# pyright: ignore`.
- Reuse existing helpers. Add no dependencies unless necessary.
- Never weaken or delete tests, add `|| true`, or write tautological or over-mocked tests. Cover happy and failure paths.

## Self-review
- Read the full diff as if it were someone else's PR: scope creep, shortcuts to fix before merge, test gaps.
- For non-trivial PRs, offer a parallel subagent review (same unsteered prompt; correctness, performance, simplicity; both architecture and line level).

## Title, description, comments
- Title: follow the repo's convention, checked against recent merged PRs (`gh pr list --state merged`), e.g. `[PLAT-1234] Area: Sentence-case summary` in universe. Where a repo has none, Conventional Commits, short and plain, e.g. `refactor: introduce new bin implementation with improved throughput`.
- Description: what changed and why in a few sentences; where the core logic is vs. what's mechanical; judgment calls worth scrutiny; how it was tested; where it fits if part of a split or stack. No changelogs restating the diff, unnecessary internal names or benchmark trivia.
- GitHub comments and replies: one point each, no preamble or summary; prefix `nit:`/`question:`/`blocking:`; use suggestion blocks for small fixes; replies to feedback are one line ("Done in abc123").
- Show me titles, descriptions and comments before posting.
