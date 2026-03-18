#!/usr/bin/env lua
-- Simple site builder for MatiasAgelvis.github.io
-- Uses Pandoc (if available) for Markdown → HTML conversion.

local function exists(cmd)
  local f = io.popen("command -v " .. cmd .. " 2>/dev/null")
  local out = f:read("*a")
  f:close()
  return out and #out > 0
end

local function run(cmd)
  local ok, exit, code = os.execute(cmd)
  if not ok then
    error(string.format("Command failed: %s (exit=%s/%s)", cmd, tostring(exit), tostring(code)))
  end
end

local function ensure_dir(path)
  run(string.format("mkdir -p %q", path))
end

local function copy(src, dst)
  run(string.format("cp -R %q %q 2>/dev/null || true", src, dst))
end

local function main()
  if not exists("pandoc") then
    io.stderr:write("Error: pandoc is required but was not found in PATH.\n")
    os.exit(1)
  end

  local out_dir = "public"

  run(string.format("rm -rf %q", out_dir))
  ensure_dir(out_dir)

  print("Building index.html...")
  run(table.concat({
    "pandoc",
    "--standalone",
    "--template=templates/base.html",
    "--toc",
    "--highlight-style=tango",
    "--metadata=author:'Matias Agelvis'",
    "--metadata=url:'https://matiasagelvis.com'",
    "--metadata=description:'Personal website of Matias Agelvis'",
    "-o public/index.html",
    "index.md",
  }, " "))

  copy("assets", out_dir)
  copy("resources", out_dir)
  copy("courses.html", out_dir)

  print("Build complete. Files are in " .. out_dir)
end

main()
