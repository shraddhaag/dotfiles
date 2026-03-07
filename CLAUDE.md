# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

Personal dotfiles repository. Supports **macOS** and **Fedora**. Running the appropriate setup script bootstraps a fresh machine with all tools and configs.

## Setup

**macOS:**
```bash
git clone <this-repo> ~/dotfiles
cd ~/dotfiles
bash setup.sh
```

**Fedora:**
```bash
git clone <this-repo> ~/dotfiles
cd ~/dotfiles
bash setup-fedora.sh
```

Both scripts are idempotent — safe to re-run.

## What Gets Installed

Neovim, fzf, ripgrep, lazygit, Ghostty, JetBrains Mono Nerd Font. macOS uses Homebrew, Fedora uses DNF (+ COPR repos for lazygit and ghostty).

## Neovim Config

Uses **LazyVim** (a Neovim distro built on lazy.nvim). Structure follows LazyVim conventions:

```
nvim/
  init.lua              -- bootstraps lazy.nvim, loads LazyVim + lua/plugins/
  lua/
    plugins/
      *.lua             -- custom plugin specs (each file returns a table)
```

- **Adding plugins**: create a new `.lua` file in `lua/plugins/` returning a lazy.nvim spec table.
- **Overriding LazyVim defaults**: return a spec with the same plugin name in `lua/plugins/` — LazyVim merges them.
- **Language extras**: add `import` lines in `init.lua` (e.g., `lazyvim.plugins.extras.lang.go`).
- **Enabled extras**: fzf (editor), Go, Python, clangd (C/C++).

## Ghostty Config

Platform-specific configs:
- `ghostty/` — macOS config (uses `super` keybinds, `macos-non-native-fullscreen`)
- `ghostty-linux/` — Fedora config (uses `gtk-titlebar = false`, `bash` shell integration)

Each setup script symlinks the correct one to `~/.config/ghostty`.

## Conventions

- Config dirs live at repo root (`nvim/`, `ghostty/`, `ghostty-linux/`) and get symlinked by the setup scripts.
- `setup.sh` is the macOS entry point, `setup-fedora.sh` is the Fedora entry point.
- When adding a new tool, add its install + symlink step to both setup scripts.
