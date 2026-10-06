# Start here

Your blog lives in this folder. Open it in VS Code and start Claude Code here.

## First time (once)

Paste `prompts/01-first-time-setup.md` into Claude Code. It installs the tools, creates the GitHub repo, switches on free hosting and gives you the live link.

No-Claude alternative: double-click `1-Setup.command` in Finder.

## Every time after

| I want to... | Paste this prompt | Or double-click |
|---|---|---|
| Write a post on a topic | `prompts/02-write-a-post.md` | `3-New-Post.command` (blank draft) |
| Turn a notebook into a post | `prompts/03-notebook-to-post.md` | |
| See the site on my machine | | `2-Preview.command` |
| Review and publish a post | `prompts/04-review-and-publish.md` | `4-Publish.command` |
| Get post ideas | `prompts/05-post-ideas.md` | |
| Add my own domain later | `prompts/06-custom-domain.md` | |

Prompts with a line in `<angle brackets>` at the top need that one line filled in.

## Edit before your first share

- `about.qmd`: your background and links (look for EDIT ME).
- `posts/2026-10-06-welcome/index.qmd`: the first post.
- `_quarto.yml`: site title and tagline.
