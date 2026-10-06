#!/bin/bash
# Shows the blog on your own machine, drafts included. Updates live as you edit. Close the window to stop.
cd "$(dirname "$0")" || exit 1
for b in /opt/homebrew/bin/brew /usr/local/bin/brew; do [ -x "$b" ] && eval "$("$b" shellenv)"; done
quarto preview
