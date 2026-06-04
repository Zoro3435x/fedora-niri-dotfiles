#!/usr/bin/env bash

case "$1" in
docker)
  if systemctl is-active --quiet docker; then
    echo "Running"
  else
    echo "Stopped"
  fi
  ;;

node)
  node --version 2>/dev/null || echo "N/A"
  ;;

angular)
  ng version 2>/dev/null | awk '/Angular CLI:/ {print $3; exit}' || echo "N/A"
  ;;

dotnet)
  dotnet --version 2>/dev/null || echo "N/A"
  ;;

python)
  python3 --version 2>/dev/null | awk '{print $2}' || echo "N/A"
  ;;

lazygit)
  if command -v lazygit >/dev/null 2>&1; then
    echo "Ready"
  else
    echo "N/A"
  fi
  ;;

gitbranch)
  if git -C "$HOME/dotfiles" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    git -C "$HOME/dotfiles" branch --show-current
  else
    echo "N/A"
  fi
  ;;

dockerps)
  kitty --title "docker ps" -e bash -lc "docker ps; echo; read -rp 'Enter para cerrar...'"
  ;;

dotfiles)
  kitty --title "dotfiles" --working-directory "$HOME/dotfiles"
  ;;

lazygit-open)
  kitty --title "lazygit" -e lazygit
  ;;

nvim-dotfiles)
  kitty --title "nvim dotfiles" --working-directory "$HOME/dotfiles" -e nvim
  ;;

dbeaver)
  flatpak run io.dbeaver.DBeaverCommunity >/tmp/eww-dbeaver.log 2>&1 &
  ;;

*)
  echo "N/A"
  ;;
esac
