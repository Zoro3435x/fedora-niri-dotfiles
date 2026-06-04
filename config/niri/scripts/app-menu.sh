#!/usr/bin/env bash

main_menu() {
  printf "󰅩  Desarrollo\n"
  printf "󰖟  Internet\n"
  printf "󰓓  Juegos\n"
  printf "󰋊  Archivos\n"
  printf "󰓃  Sistema\n"
  printf "  Multimedia\n"
  printf "󰅖  Salir\n"
}

submenu() {
  local prompt="$1"
  shift

  {
    printf "󰁍  Volver\n"
    printf "%s\n" "$@"
  } | fuzzel --dmenu --prompt="$prompt > " --width=38 --lines=10
}

while true; do
  category=$(main_menu | fuzzel --dmenu --prompt="Apps > " --width=38 --lines=8)

  case "$category" in
  *"Desarrollo"*)
    while true; do
      app=$(submenu "Dev" \
        "  Kitty" \
        "  Neovim" \
        "󰌠  Python" \
        "󰪮  .NET" \
        "󰛦  VS Code")

      case "$app" in
      *"Volver"*) break ;;
      *"Kitty"*)
        kitty &
        exit 0
        ;;
      *"Neovim"*)
        kitty -e nvim &
        exit 0
        ;;
      *"Python"*)
        kitty -e python3 &
        exit 0
        ;;
      *".NET"*)
        kitty -e bash -lc "dotnet --info; exec bash" &
        exit 0
        ;;
      *"VS Code"*)
        code &
        exit 0
        ;;
      "") break ;;
      esac
    done
    ;;

  *"Internet"*)
    while true; do
      app=$(submenu "Internet" \
        "󰈹  Firefox" \
        "󰖩  Redes")

      case "$app" in
      *"Volver"*) break ;;
      *"Firefox"*)
        firefox &
        exit 0
        ;;
      *"Redes"*)
        ~/.config/waybar/scripts/network-menu.sh &
        exit 0
        ;;
      "") break ;;
      esac
    done
    ;;

  *"Juegos"*)
    while true; do
      app=$(submenu "Juegos" \
        "  Steam")

      case "$app" in
      *"Volver"*) break ;;
      *"Steam"*)
        ~/.config/waybar/scripts/open-steam.sh &
        exit 0
        ;;
      "") break ;;
      esac
    done
    ;;

  *"Archivos"*)
    while true; do
      app=$(submenu "Archivos" \
        "  Archivos" \
        "󰉋  Home" \
        "󰉍  Descargas")

      case "$app" in
      *"Volver"*) break ;;
      *"Archivos"*)
        nautilus &
        exit 0
        ;;
      *"Home"*)
        nautilus "$HOME" &
        exit 0
        ;;
      *"Descargas"*)
        nautilus "$HOME/Descargas" &
        exit 0
        ;;
      "") break ;;
      esac
    done
    ;;

  *"Sistema"*)
    while true; do
      app=$(submenu "Sistema" \
        "  Btop" \
        "󰒓  Quick Panel" \
        "󰌾  Bloquear" \
        "⏻  Apagar / Salir")

      case "$app" in
      *"Volver"*) break ;;
      *"Btop"*)
        ~/.config/eww/scripts/open-btop.sh &
        exit 0
        ;;
      *"Quick Panel"*)
        ~/.config/eww/scripts/toggle-panel.sh &
        exit 0
        ;;
      *"Bloquear"*)
        ~/.config/eww/scripts/lock-safe.sh &
        exit 0
        ;;
      *"Apagar"*)
        wlogout &
        exit 0
        ;;
      "") break ;;
      esac
    done
    ;;

  *"Multimedia"*)
    while true; do
      app=$(submenu "Media" \
        "  Spotify" \
        "  Audio")

      case "$app" in
      *"Volver"*) break ;;
      *"Spotify"*)
        flatpak run com.spotify.Client &
        exit 0
        ;;
      *"Audio"*)
        ~/.config/eww/scripts/open-audio.sh &
        exit 0
        ;;
      "") break ;;
      esac
    done
    ;;

  *"Salir"*)
    exit 0
    ;;

  "")
    exit 0
    ;;
  esac
done
