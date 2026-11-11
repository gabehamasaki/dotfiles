#!/bin/sh
# Neovim >= 0.12 and lazygit are not available on apt (Ubuntu 24.04), so they come from GitHub releases.
set -e

if [ "$(uname -m)" != "x86_64" ]; then
  echo "install-nvim-deps: only x86_64 is supported" >&2
  exit 1
fi

if [ ! -x /opt/nvim-linux-x86_64/bin/nvim ]; then
  curl -fsSL -o /tmp/nvim.tar.gz https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
  sudo tar -C /opt -xzf /tmp/nvim.tar.gz
  rm /tmp/nvim.tar.gz
fi

if [ ! -x "$HOME/.local/bin/lazygit" ]; then
  version=$(curl -fsSL https://api.github.com/repos/jesseduffield/lazygit/releases/latest | jq -r '.tag_name | ltrimstr("v")')
  curl -fsSL -o /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${version}/lazygit_${version}_Linux_x86_64.tar.gz"
  mkdir -p "$HOME/.local/bin"
  tar -C "$HOME/.local/bin" -xzf /tmp/lazygit.tar.gz lazygit
  rm /tmp/lazygit.tar.gz
fi
