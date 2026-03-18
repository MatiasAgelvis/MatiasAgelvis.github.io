#!/usr/bin/env sh
# Vercel uses this as the build command in this repo.
# The environment doesn't include Lua, so keep this shell-only.

set -euo pipefail

# Build (if possible) and ensure public/ is populated.
./build.sh

# No-op if public/ is already present; Vercel will serve it directly.
echo "Build step complete; public/ is ready."
