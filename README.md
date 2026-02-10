# coding-standards

A Claude Code agent skill that enforces language-specific coding standards.

Detects your project language and applies the right style guide:

- **Python** — Google Python Style Guide
- **TypeScript** — Anthony Fu's ESLint Config
- **JavaScript** — Airbnb JavaScript Style Guide
- **Go** — Uber Go Style Guide
- **Rust** — Rust API Guidelines
- **C/C++** — LLVM Coding Standards

Also includes optional commit message linting via commitlint + Conventional Commits.

## Install

```bash
npx skills add coding-standards-agent-skills
```

## Usage

Once installed, the skill activates automatically when you ask Claude Code to review code, fix style, apply best practices, or follow a style guide.

You can also invoke it directly:

```
/coding-standards
```

## Commit linting

To set up commitlint with a `commit-msg` git hook:

```bash
bash scripts/setup-commitlint.sh
```

Detects your package manager (npm/pnpm/yarn/bun), installs `@commitlint/cli` + `@commitlint/config-conventional`, and hooks it up.

## License

[MIT](LICENSE)
