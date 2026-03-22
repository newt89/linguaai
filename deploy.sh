#!/bin/bash
# Run this once to deploy - finds the latest linguaai download automatically
LATEST=$(ls ~/Downloads/linguaai*.html 2>/dev/null | sort -V | tail -1)
if [ -z "$LATEST" ]; then
  echo "❌ No linguaai file found in ~/Downloads/"
  exit 1
fi
echo "✅ Found: $LATEST"
cp "$LATEST" ~/linguaai/index.html
echo "✅ Copied to repo"
cd ~/linguaai
git add index.html
git commit -m "Update site"
git push
git checkout gh-pages
git reset --hard origin/main
git push origin gh-pages --force
git checkout main
echo "🚀 Deployed! Visit https://newt89.github.io/linguaai in 60 seconds"
