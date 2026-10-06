REPOSITORY: ~/Content-Writer (the blog)
SESSION: Claude Code opened in the ~/Content-Writer folder in VS Code

POST: <replace this line with the post folder name under posts/, or write "latest draft">

Review the POST above and publish it. Read CLAUDE.md first.

1. Review it as a careful editor: unclear sentences, missing steps, claims without support, typos, broken links, missing diagram, weak title or description. List the problems, most important first.
2. Wait for me to say which fixes to apply. Apply only those.
3. When I say "publish": remove `draft: true`, run `quarto render`, commit with a clear message and push to main.
4. Watch the run with `gh run watch`. If it fails, fix and push again.
5. Give me the live link to the post and a two-sentence summary I can use when sharing it.
