#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> dotfiles setup starting..."

# --- Homebrew ---
if ! command -v brew &>/dev/null; then
  echo "==> Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add brew to PATH for the rest of this script (Apple Silicon vs Intel)
  if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -f /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
else
  echo "==> Homebrew already installed"
fi

# --- Neovim ---
if ! command -v nvim &>/dev/null; then
  echo "==> Installing Neovim..."
  brew install neovim
else
  if brew outdated --quiet | grep -q '^neovim$'; then
    echo "==> Upgrading Neovim to latest..."
    brew upgrade neovim
  else
    echo "==> Neovim already up to date"
  fi
fi

# --- fzf (fuzzy finder, used by Telescope) ---
if ! command -v fzf &>/dev/null; then
  echo "==> Installing fzf..."
  brew install fzf
else
  echo "==> fzf already installed"
fi

# --- ripgrep (needed by Telescope live grep) ---
if ! brew list ripgrep &>/dev/null; then
  echo "==> Installing ripgrep..."
  brew install ripgrep
else
  echo "==> ripgrep already installed"
fi

# --- lazygit (git TUI, used by LazyVim) ---
if ! command -v lazygit &>/dev/null; then
  echo "==> Installing lazygit..."
  brew install lazygit
else
  echo "==> lazygit already installed"
fi

# --- Ghostty (terminal emulator) ---
if ! brew list --cask ghostty &>/dev/null; then
  echo "==> Installing Ghostty..."
  brew install --cask ghostty
else
  echo "==> Ghostty already installed"
fi

# --- Nerd Font (needed for icons in Neovim) ---
if ! brew list --cask font-jetbrains-mono-nerd-font &>/dev/null; then
  echo "==> Installing JetBrains Mono Nerd Font..."
  brew install --cask font-jetbrains-mono-nerd-font
else
  echo "==> JetBrains Mono Nerd Font already installed"
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

# --- Symlink Ghostty config ---
GHOSTTY_CONFIG_DIR="$HOME/.config/ghostty"
if [[ -L "$GHOSTTY_CONFIG_DIR" ]]; then
  echo "==> Ghostty config symlink already exists"
elif [[ -d "$GHOSTTY_CONFIG_DIR" ]]; then
  echo "==> WARNING: $GHOSTTY_CONFIG_DIR already exists and is not a symlink."
  echo "    Back it up and re-run, or remove it manually."
else
  echo "==> Symlinking Ghostty config..."
  mkdir -p "$HOME/.config"
  ln -s "$DOTFILES_DIR/ghostty" "$GHOSTTY_CONFIG_DIR"
fi

echo "==> Done! Open nvim to trigger plugin installation."
