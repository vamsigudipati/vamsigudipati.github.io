REPOSITORY: ~/Content-Writer (the blog)
SESSION: Claude Code opened in the ~/Content-Writer folder in VS Code

DOMAIN: <replace this line with the domain I bought, for example vamsigudipati.com>

Connect the DOMAIN above to this blog. Read CLAUDE.md first.

1. Tell me exactly which DNS records to add at my registrar for GitHub Pages (the apex A/AAAA records and the `www` CNAME), and wait until I confirm they are added.
2. Set the custom domain on the repo with `gh api -X PUT repos/<owner>/<repo>/pages -f cname=<domain>`.
3. Update `site-url` in `_quarto.yml` to `https://<domain>`, render, commit and push.
4. Check DNS with `dig`, then turn on HTTPS enforcement once the certificate is ready.
5. Confirm the site loads on the new domain and add an entry to DECISIONS.md.
