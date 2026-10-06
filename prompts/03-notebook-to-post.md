REPOSITORY: ~/Content-Writer (the blog)
SESSION: Claude Code opened in the ~/Content-Writer folder in VS Code

SOURCE: <replace this line with the path to the notebook or script, for example ~/SciML_Studio/some_notebook.ipynb>

Turn the SOURCE above into a blog post. Read CLAUDE.md first.

1. Read the source. Tell me in three lines what it shows and what the post's main point should be.
2. Check for anything that should not be public (employer or client material, private data, API keys, paid course content copied verbatim). If you find any, stop and tell me.
3. Create `posts/<today's date>-<slug>/index.qmd` with `draft: true`. Keep only the code a reader needs; move long cells into collapsed blocks (`code-fold: true`).
4. Open with a diagram of the idea, explain each step from the basics, and keep the key plots.
5. If the post executes code, run it locally so `_freeze/` is created, and include `_freeze/` in the commit later.
6. Run `quarto render`, fix errors, and tell me how to preview. Do not publish.
