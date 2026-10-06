#!/bin/bash
# Creates a new draft post from the template and opens it.
cd "$(dirname "$0")" || exit 1
read -r -p "Post title: " TITLE
[ -z "$TITLE" ] && { echo "No title given."; exit 1; }
SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+|-+$//g')
DATE=$(date +%Y-%m-%d)
DIR="posts/$DATE-$SLUG"
[ -e "$DIR" ] && { echo "$DIR already exists."; exit 1; }
mkdir -p "$DIR"
SAFE=$(printf '%s' "$TITLE" | sed 's/[\\&|"]/\\&/g')
sed -e "s|__TITLE__|$SAFE|" -e "s|__DATE__|$DATE|" _templates/post.qmd > "$DIR/index.qmd"
echo "Created $DIR/index.qmd (a draft: it stays off the live site until you remove 'draft: true')."
if command -v code >/dev/null 2>&1; then code . "$DIR/index.qmd"; else open -t "$DIR/index.qmd"; fi
