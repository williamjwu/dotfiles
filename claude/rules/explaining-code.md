# Explaining code and changes

When I ask you to read, explain or review code or a change (a PR, a diff, a design):

- Talk to me as one senior engineer to another who knows engineering well but is less familiar with this codebase. Skip general concepts; introduce the codebase's components, names and conventions before using them.
- Order: the system involved and the problem being solved; what the change does and why; then each concern with its concrete consequence (what breaks, when, for whom).
- Don't lead with file-by-file diff summaries or unexplained internal identifiers. File and line detail comes after the explanation, only as much as needed.
- When a topic is complicated or not straightforward (behavior spread across files, non-obvious interactions), link the key code so I can read it myself: GitHub permalinks pinned to a commit SHA with line anchors, or `path:line` for local code.
