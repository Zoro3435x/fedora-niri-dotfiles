#!/usr/bin/env bash

DOTFILES="$HOME/dotfiles/config"

rm -rf "$DOTFILES/niri"
rm -rf "$DOTFILES/waybar"
rm -rf "$DOTFILES/kitty"
rm -rf "$DOTFILES/fuzzel"
rm -rf "$DOTFILES/mako"
rm -rf "$DOTFILES/wlogout"
rm -rf "$DOTFILES/eww"
rm -rf "$DOTFILES/fastfetch"
rm -rf "$DOTFILES/nvim"

cp -r "$HOME/.config/niri" "$DOTFILES/"
cp -r "$HOME/.config/waybar" "$DOTFILES/"
cp -r "$HOME/.config/kitty" "$DOTFILES/"
cp -r "$HOME/.config/fuzzel" "$DOTFILES/"
cp -r "$HOME/.config/mako" "$DOTFILES/"
cp -r "$HOME/.config/wlogout" "$DOTFILES/"
cp -r "$HOME/.config/eww" "$DOTFILES/"
cp -r "$HOME/.config/fastfetch" "$DOTFILES/"
cp -r "$HOME/.config/nvim" "$DOTFILES/"

cp "$HOME/.config/starship.toml" "$DOTFILES/starship.toml" 2>/dev/null

cd "$HOME/dotfiles" || exit
git add .
git status
