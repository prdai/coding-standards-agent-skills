This is a skills.sh agent skill for enforcing coding standards.

## Project structure

- `SKILL.md` — skill definition (frontmatter + instructions)
- `.commitlintrc` — commitlint config template (Conventional Commits)
- `scripts/setup-commitlint.sh` — installs commitlint + git hook
- `metadata.json` — skill metadata and reference URLs

## Conventions

- Commits follow Conventional Commits: `type(scope): subject`
- Keep commits single-line, under 72 characters
- Shell scripts use `set -euo pipefail`, no comments, kept minimal
- Config files are JSON
- License is Apache 2.0
