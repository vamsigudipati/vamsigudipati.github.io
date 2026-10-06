# Decisions

## 2026-10-06: Blog platform

- **Decision:** Build the blog as my own website with Quarto, hosted on GitHub Pages.
- **Why:** I wanted my own site at low cost. Hosting is free; the only possible cost is a custom domain later. Posts are plain Markdown or notebooks, so code, equations and diagrams work without extra tools, and all content stays in a Git repo I own.
- **Alternatives set aside:** Substack and Medium (faster to start, but not my own site and weaker for code and math).

## 2026-10-06: How posts get published

- **Decision:** Pushing to `main` publishes the site through a GitHub Actions workflow. New posts start as drafts.
- **Why:** One step to publish, and a draft cannot go live by accident.

## 2026-10-06: Repo name and blog address

- **Decision:** The blog lives in the public GitHub repo `vamsigudipati/vamsigudipati.github.io` and is served at <https://vamsigudipati.github.io>.
- **Why:** I had no repo with that name, so I could take the short address with no `/blog` path at the end.
- **Alternatives set aside:** A repo named `blog` at `https://vamsigudipati.github.io/blog` (only needed if the short name was already taken).
