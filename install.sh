#!/usr/bin/env bash
set -euo pipefail

echo "==> Installing Homebrew packages..."
brew bundle

echo "==> Stowing dotfiles..."
for pkg in */; do
  pkg="${pkg%/}"
  [ "$pkg" = ".git" ] && continue
  stow -R "$pkg"
done

echo "==> Enabling services..."
yabai --start-service 2>/dev/null || true
skhd --start-service 2>/dev/null || true
brew services start sketchybar 2>/dev/null || true
brew services start borders 2>/dev/null || true

echo "==> Done!"
