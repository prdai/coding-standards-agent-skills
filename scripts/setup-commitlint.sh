#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel 2>/dev/null)" || { echo "Not a git repo." >&2; exit 1; }
cd "$REPO_ROOT"

if [ -f "pnpm-lock.yaml" ]; then INSTALL="pnpm add -D"
elif [ -f "yarn.lock" ]; then INSTALL="yarn add -D"
elif [ -f "bun.lockb" ] || [ -f "bun.lock" ]; then INSTALL="bun add -d"
else INSTALL="npm install -D"
fi

[ ! -f "package.json" ] && ${INSTALL%% *} init -y

$INSTALL @commitlint/cli @commitlint/config-conventional

HAS_CONFIG=$(ls .commitlintrc* commitlint.config.* 2>/dev/null | head -1 || true)
if [ -z "$HAS_CONFIG" ]; then
  SKILL_ROOT="$(dirname "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)")"
  if [ -f "$SKILL_ROOT/.commitlintrc" ]; then
    cp "$SKILL_ROOT/.commitlintrc" .commitlintrc
  else
    echo '{ "extends": ["@commitlint/config-conventional"] }' > .commitlintrc
  fi
fi

HOOK="$REPO_ROOT/.git/hooks/commit-msg"

if [ ! -f "$HOOK" ] || ! grep -q "commitlint" "$HOOK" 2>/dev/null; then
  mkdir -p "$(dirname "$HOOK")"
  printf '#!/usr/bin/env bash\nnpx --no -- commitlint --edit "$1"\n' > "$HOOK"
  chmod +x "$HOOK"
fi

echo "Done — commitlint is ready."
