#!/bin/bash
# Builds the site to check it, then pushes to GitHub, which puts it live.
cd "$(dirname "$0")" || exit 1
for b in /opt/homebrew/bin/brew /usr/local/bin/brew; do [ -x "$b" ] && eval "$("$b" shellenv)"; done
stop() { echo; echo "STOPPED: $1"; read -n 1 -s -r -p "Press any key to close."; exit 1; }
git remote get-url origin >/dev/null 2>&1 || stop "Not set up yet. Run 1-Setup.command first."

echo "Building the site..."
quarto render || stop "The site did not build. Nothing was published. Fix the error above (or paste it into Claude)."

git add -A
if git diff --cached --quiet; then
  echo "Nothing new to publish."
else
  read -r -p "Short note on what changed (Enter for default): " MSG
  git commit -q -m "${MSG:-Update blog}" || stop "Commit failed."
  git push -q || stop "Push failed."
  echo "Publishing (about 1 to 2 minutes)..."
  sleep 8
  RUN=$(gh run list --limit 1 --json databaseId -q '.[0].databaseId' 2>/dev/null)
  [ -n "$RUN" ] && gh run watch "$RUN" --exit-status
fi
URL=$(grep -m1 'site-url:' _quarto.yml | sed 's/.*site-url: *//')
echo "Live at: $URL"
open "$URL"
read -n 1 -s -r -p "Press any key to close."
