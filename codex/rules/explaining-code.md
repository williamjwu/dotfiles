# Explaining code and changes

When I ask you to read, explain or review code or a change (a PR, a diff, a design):

- Open with a one-line conclusion, then in this order: the system involved and the problem being solved; what the change does and why; then each concern with its concrete consequence (what breaks, when, for whom).
- File and line detail comes after the explanation, only as much as needed; name an internal identifier only after introducing it.
- When a topic is complicated or not straightforward (behavior spread across files, non-obvious interactions), link the key code so I can read it myself: GitHub permalinks pinned to a commit SHA with line anchors, or `path:line` for local code.
