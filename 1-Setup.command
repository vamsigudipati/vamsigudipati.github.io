#!/bin/bash
# One-time setup: installs the tools, creates the GitHub repo, turns on free hosting, publishes.
cd "$(dirname "$0")" || exit 1
stop() { echo; echo "STOPPED: $1"; echo; read -n 1 -s -r -p "Press any key to close."; exit 1; }

echo "== Blog setup =="
if ! command -v brew >/dev/null 2>&1; then
  for b in /opt/homebrew/bin/brew /usr/local/bin/brew; do [ -x "$b" ] && eval "$("$b" shellenv)"; done
fi
command -v brew >/dev/null 2>&1 || stop "Homebrew is not installed. Install it from https://brew.sh, then double-click this file again."
command -v git >/dev/null 2>&1 || stop "git is not installed. Run: xcode-select --install"

command -v quarto >/dev/null 2>&1 || { echo "Installing Quarto..."; brew install --cask quarto || stop "Quarto install failed."; }
command -v gh >/dev/null 2>&1 || { echo "Installing GitHub CLI..."; brew install gh || stop "GitHub CLI install failed."; }

if ! gh auth status >/dev/null 2>&1; then
  echo "Sign in to GitHub in the browser window that opens."
  gh auth login --web --git-protocol https || stop "GitHub sign-in did not finish."
fi
gh auth setup-git

LOGIN=$(gh api user -q .login) || stop "Could not read your GitHub username."
git config user.name  >/dev/null || git config --global user.name "$LOGIN"
git config user.email >/dev/null || git config --global user.email "$(gh api user -q .id)+$LOGIN@users.noreply.github.com"

if git remote get-url origin >/dev/null 2>&1; then
  echo "This folder is already linked to GitHub. Nothing to set up; use 4-Publish.command."
  URL=$(grep -m1 'site-url:' _quarto.yml | sed 's/.*site-url: *//')
else
  if gh repo view "$LOGIN/$LOGIN.github.io" >/dev/null 2>&1; then
    REPO="blog"; URL="https://$LOGIN.github.io/blog"
    gh repo view "$LOGIN/$REPO" >/dev/null 2>&1 && stop "You already have repos named $LOGIN.github.io and blog. Rename one, or ask Claude using prompts/01-first-time-setup.md."
  else
    REPO="$LOGIN.github.io"; URL="https://$LOGIN.github.io"
  fi
  echo "Your blog address will be: $URL"
  sed -i '' "s|^  site-url:.*|  site-url: $URL|" _quarto.yml

  rm -rf .github/workflows; mkdir -p .github/workflows && cp _templates/publish.yml .github/workflows/publish.yml || stop "Could not put the publish workflow in place."
  [ -d .git ] || git init -q -b main
  git add -A && git commit -q -m "Start the blog" || stop "Could not create the first commit."
  gh repo create "$LOGIN/$REPO" --public --source=. --remote=origin || stop "Could not create the GitHub repo."
  PAGES_OK=0
  gh api -X POST "repos/$LOGIN/$REPO/pages" -f build_type=workflow >/dev/null 2>&1 && PAGES_OK=1
  git push -q -u origin main || stop "Could not push to GitHub."
  if [ $PAGES_OK -eq 0 ]; then
    sleep 3
    gh api -X POST "repos/$LOGIN/$REPO/pages" -f build_type=workflow >/dev/null 2>&1 \
      || stop "Repo created, but hosting could not be switched on automatically. On GitHub open Settings > Pages and set Source to 'GitHub Actions', then run 4-Publish.command."
    gh workflow run publish.yml >/dev/null 2>&1
  fi
  echo "Publishing (about 1 to 2 minutes)..."
  sleep 8
  RUN=$(gh run list --limit 1 --json databaseId -q '.[0].databaseId')
  [ -n "$RUN" ] && gh run watch "$RUN" --exit-status || echo "Could not confirm the publish run; check the Actions tab on GitHub."
fi

echo; echo "Done. Your blog: $URL"
open "$URL"
read -n 1 -s -r -p "Press any key to close."
