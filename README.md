# coding-standards

An agent skill that enforces language-specific coding standards. Built for [skills.sh](https://skills.sh).

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
npx skills add prdai/coding-standards-agent-skills
```

## Usage

Once installed, the skill activates automatically when your AI agent is asked to review code, fix style, apply best practices, or follow a style guide.

## Commit linting

To set up commitlint with a `commit-msg` git hook:

```bash
bash scripts/setup-commitlint.sh
```

Detects your package manager (npm/pnpm/yarn/bun), installs `@commitlint/cli` + `@commitlint/config-conventional`, and hooks it up.

## License

[Apache 2.0](LICENSE)
