REPOSITORY: ~/Content-Writer (the blog)
SESSION: Claude Code opened in the ~/Content-Writer folder in VS Code

Set up this blog and publish it for the first time. Read CLAUDE.md first.

1. Check that Homebrew, git, Quarto and the GitHub CLI (gh) are installed. Install what is missing with Homebrew (`brew install --cask quarto`, `brew install gh`).
2. Check `gh auth status`. If I am not signed in, tell me to run `! gh auth login --web --git-protocol https` and wait for me.
3. Run `quarto render` and fix anything that fails.
4. Get my GitHub username with `gh api user -q .login`. If I have no repo named `<username>.github.io`, use that name (blog address `https://<username>.github.io`). Otherwise use a repo named `blog` (address `https://<username>.github.io/blog`). Tell me the address before creating anything.
5. Set `site-url` in `_quarto.yml` to that address. Copy `_templates/publish.yml` to `.github/workflows/publish.yml` (create the folders); it must be the only file in `.github/workflows`, so delete anything else there, such as a leftover `t.yml`.
6. `git init -b main`, commit everything, create the repo as public with `gh repo create ... --source=. --remote=origin`, enable Pages with `gh api -X POST repos/<username>/<repo>/pages -f build_type=workflow`, then push.
7. Watch the publish run with `gh run watch` until it finishes. If it fails, read the log, fix it and push again.
8. Open the live address and confirm the home page, the About page and the first post load. Give me the link.
9. Add an entry to DECISIONS.md with the repo name and address chosen.
