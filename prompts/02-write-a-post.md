REPOSITORY: ~/Content-Writer (the blog)
SESSION: Claude Code opened in the ~/Content-Writer folder in VS Code

TOPIC: <replace this line with what the post is about, plus any notes, links or files to draw from>

Write a new blog post on the TOPIC above. Read CLAUDE.md first and follow its writing rules.

1. Ask me up to three short questions if the angle, the reader or the key takeaway is unclear. Otherwise go ahead.
2. Create `posts/<today's date>-<slug>/index.qmd` from `_templates/post.qmd`, with `draft: true`.
3. Open with a diagram that shows the idea in one picture, then explain from the basics in my voice (first person, plain words).
4. Use only facts from my notes or files, or that you have checked. Mark anything you could not confirm with a visible TODO.
5. Run `quarto render` to confirm the site builds.
6. Show me the title, the one-sentence description and the outline, and tell me how to preview it (`quarto preview`). Do not publish.
