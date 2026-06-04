#!/usr/bin/env bash

set -e

echo "==> Installing dependencies..."

sudo dnf install -y \
  niri \
  waybar \
  kitty \
  fuzzel \
  swaybg \
  mako \
  swaylock \
  wlogout \
  cliphist \
  wl-clipboard \
  btop \
  zoxide \
  fastfetch \
  playerctl \
  pavucontrol \
  yad \
  jq \
  git \
  curl \
  unzip \
  tar \
  neovim \
  papirus-icon-theme \
  gh

echo "==> Creating config backup..."

mkdir -p "$HOME/.config/backup-dotfiles"

for dir in niri waybar kitty fuzzel mako wlogout eww fastfetch nvim; do
  if [ -e "$HOME/.config/$dir" ]; then
    mv "$HOME/.config/$dir" "$HOME/.config/backup-dotfiles/${dir}.bak.$(date +%Y%m%d-%H%M%S)"
  fi
done

if [ -e "$HOME/.config/starship.toml" ]; then
  mv "$HOME/.config/starship.toml" "$HOME/.config/backup-dotfiles/starship.toml.bak.$(date +%Y%m%d-%H%M%S)"
fi

echo "==> Copying configs..."

mkdir -p "$HOME/.config"

cp -r "$HOME/dotfiles/config/niri" "$HOME/.config/"
cp -r "$HOME/dotfiles/config/waybar" "$HOME/.config/"
cp -r "$HOME/dotfiles/config/kitty" "$HOME/.config/"
cp -r "$HOME/dotfiles/config/fuzzel" "$HOME/.config/"
cp -r "$HOME/dotfiles/config/mako" "$HOME/.config/"
cp -r "$HOME/dotfiles/config/wlogout" "$HOME/.config/"
cp -r "$HOME/dotfiles/config/eww" "$HOME/.config/"
cp -r "$HOME/dotfiles/config/fastfetch" "$HOME/.config/"
cp -r "$HOME/dotfiles/config/nvim" "$HOME/.config/"

if [ -f "$HOME/dotfiles/config/starship.toml" ]; then
  cp "$HOME/dotfiles/config/starship.toml" "$HOME/.config/starship.toml"
fi

echo "==> Setting script permissions..."

chmod +x "$HOME/.config/niri/scripts/"*.sh 2>/dev/null || true
chmod +x "$HOME/.config/waybar/scripts/"*.sh 2>/dev/null || true
chmod +x "$HOME/.config/eww/scripts/"*.sh 2>/dev/null || true

echo "==> Applying GTK preferences..."

mkdir -p "$HOME/.config/gtk-3.0" "$HOME/.config/gtk-4.0"

cat >"$HOME/.config/gtk-3.0/settings.ini" <<'EOF'
[Settings]
gtk-theme-name=Adwaita
gtk-icon-theme-name=Papirus-Dark
gtk-font-name=JetBrainsMono Nerd Font 11
gtk-cursor-theme-name=Adwaita
gtk-application-prefer-dark-theme=1
EOF

cat >"$HOME/.config/gtk-4.0/settings.ini" <<'EOF'
[Settings]
gtk-theme-name=Adwaita
gtk-icon-theme-name=Papirus-Dark
gtk-font-name=JetBrainsMono Nerd Font 11
gtk-cursor-theme-name=Adwaita
gtk-application-prefer-dark-theme=1
EOF

gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark' || true
gsettings set org.gnome.desktop.interface font-name 'JetBrainsMono Nerd Font 11' || true
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark' || true

echo "==> Validating Niri config..."

niri validate || true

echo "==> Done."
echo "Restart your Niri session to apply everything."
