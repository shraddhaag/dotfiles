#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> dotfiles setup (Fedora) starting..."

# --- DNF essentials ---
echo "==> Installing base dependencies..."
sudo dnf install -y git curl gcc gcc-c++ make cmake unzip

# --- Neovim ---
if ! command -v nvim &>/dev/null; then
  echo "==> Installing Neovim..."
  sudo dnf install -y neovim
else
  echo "==> Upgrading Neovim to latest..."
  sudo dnf upgrade -y neovim
fi

# --- fzf (fuzzy finder, used by fzf-lua) ---
if ! command -v fzf &>/dev/null; then
  echo "==> Installing fzf..."
  sudo dnf install -y fzf
else
  echo "==> fzf already installed"
fi

# --- ripgrep (needed by fzf-lua live grep) ---
if ! command -v rg &>/dev/null; then
  echo "==> Installing ripgrep..."
  sudo dnf install -y ripgrep
else
  echo "==> ripgrep already installed"
fi

# --- lazygit (git TUI, used by LazyVim) ---
if ! command -v lazygit &>/dev/null; then
  echo "==> Installing lazygit..."
  sudo dnf copr enable -y atim/lazygit
  sudo dnf install -y lazygit
else
  echo "==> lazygit already installed"
fi

# --- Ghostty (terminal emulator) ---
if ! command -v ghostty &>/dev/null; then
  echo "==> Installing Ghostty..."
  sudo dnf copr enable -y pgdev/ghostty
  sudo dnf install -y ghostty
else
  echo "==> Ghostty already installed"
fi

# --- Nerd Font (needed for icons in Neovim) ---
FONT_DIR="$HOME/.local/share/fonts"
if ! fc-list | grep -qi "JetBrainsMono Nerd Font"; then
  echo "==> Installing JetBrains Mono Nerd Font..."
  mkdir -p "$FONT_DIR"
  cd /tmp
  curl -fLO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
  unzip -o JetBrainsMono.zip -d "$FONT_DIR/JetBrainsMono"
  fc-cache -fv
  rm -f JetBrainsMono.zip
  cd "$DOTFILES_DIR"
else
  echo "==> JetBrains Mono Nerd Font already installed"
fi

# --- Node.js (needed by markdown-preview.nvim) ---
if ! command -v node &>/dev/null; then
  echo "==> Installing Node.js..."
  sudo dnf install -y nodejs npm
else
  echo "==> Node.js already installed"
fi

# --- Symlink Neovim config ---
NVIM_CONFIG_DIR="$HOME/.config/nvim"
if [[ -L "$NVIM_CONFIG_DIR" ]]; then
  echo "==> Neovim config symlink already exists"
elif [[ -d "$NVIM_CONFIG_DIR" ]]; then
  echo "==> WARNING: $NVIM_CONFIG_DIR already exists and is not a symlink."
  echo "    Back it up and re-run, or remove it manually."
else
  echo "==> Symlinking Neovim config..."
  mkdir -p "$HOME/.config"
  ln -s "$DOTFILES_DIR/nvim" "$NVIM_CONFIG_DIR"
fi

# --- Symlink Ghostty config (Fedora) ---
GHOSTTY_CONFIG_DIR="$HOME/.config/ghostty"
if [[ -L "$GHOSTTY_CONFIG_DIR" ]]; then
  echo "==> Ghostty config symlink already exists"
elif [[ -d "$GHOSTTY_CONFIG_DIR" ]]; then
  echo "==> WARNING: $GHOSTTY_CONFIG_DIR already exists and is not a symlink."
  echo "    Back it up and re-run, or remove it manually."
else
  echo "==> Symlinking Ghostty config..."
  mkdir -p "$HOME/.config"
  ln -s "$DOTFILES_DIR/ghostty-linux" "$GHOSTTY_CONFIG_DIR"
fi

echo "==> Done! Open nvim to trigger plugin installation."
