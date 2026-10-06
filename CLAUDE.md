# Content-Writer: Vamsi's blog

A Quarto website published free on GitHub Pages. Pushing to `main` publishes it (see `.github/workflows/publish.yml`, copied from `_templates/publish.yml` during setup).

## Layout

- `_quarto.yml`: site settings (title, navbar, theme, `site-url`).
- `index.qmd`: home page, lists everything in `posts/`.
- `about.qmd`: About page.
- `posts/YYYY-MM-DD-slug/index.qmd`: one folder per post; images and notebooks for a post live in its folder.
- `_templates/post.qmd`: starting point for a new post.
- `prompts/`: paste-ready prompts for common jobs.
- `DECISIONS.md`: record of decisions about the blog and why. Add an entry whenever a decision is made, written as Vamsi's decision.

## Commands

- Preview locally (drafts visible): `quarto preview`
- Check the build: `quarto render`
- Publish: commit and `git push` to `main`, then `gh run watch` to confirm.

## Writing rules

- First person, plain words, short paragraphs. Explain from the basics.
- Lead with a picture: every concept post opens with a diagram (Mermaid in a ```{mermaid} block, or a figure) before the prose.
- Front matter on every post: `title`, `description` (one sentence), `date`, `categories`.
- New posts start with `draft: true`. Never remove `draft: true` or push without Vamsi saying so.
- Posts with executed code: run them locally so `_freeze/` is updated, and commit `_freeze/`. The publish workflow does not run Python.
- Never invent results, numbers, citations or experience. If a fact is missing, ask or leave a visible `TODO`.
- Never include confidential material from employers or clients, private data, or anything from a folder without checking it is fine to publish.
