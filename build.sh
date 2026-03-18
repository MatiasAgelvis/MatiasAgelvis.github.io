#!/usr/bin/env bash
set -euo pipefail

# Build the site using Lua script (uses pandoc internally).
# Usage: ./build.sh

lua build.lua
