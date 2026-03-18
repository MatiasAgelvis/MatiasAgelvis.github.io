#!/usr/bin/env bash
set -euo pipefail

# Build the site using pandoc (if available).
# Usage: ./build.sh

if ! command -v pandoc >/dev/null 2>&1; then
  echo "pandoc not found; skipping build. Ensure public/ is up to date." >&2
  exit 0
fi

OUT_DIR="public"

rm -rf "$OUT_DIR"
mkdir -p "$OUT_DIR"

echo "Building index.html..."
pandoc \
  --standalone \
  --template=templates/base.html \
  --toc \
  --highlight-style=tango \
  --metadata=author:'Matias Agelvis' \
  --metadata=url:'https://matiasagelvis.com' \
  --metadata=description:'Personal website of Matias Agelvis' \
  -o "$OUT_DIR/index.html" \
  index.md

cp -R assets "$OUT_DIR/" 2>/dev/null || true
cp -R resources "$OUT_DIR/" 2>/dev/null || true
cp courses.html "$OUT_DIR/" 2>/dev/null || true

echo "Build complete. Files are in $OUT_DIR"
