#!/usr/bin/env bash

choice=$(printf "󰖩  Redes\n  Audio\n󰂯  Bluetooth\n  Portapapeles\n  Monitor del sistema\n󰌾  Bloquear\n⏻  Apagar / Salir" |
  fuzzel --dmenu \
    --prompt="Quick Settings > " \
    --width=38 \
    --lines=7)

case "$choice" in
*"Redes"*)
  nm-connection-editor
  ;;

*"Audio"*)
  pavucontrol
  ;;

*"Bluetooth"*)
  blueman-manager
  ;;

*"Portapapeles"*)
  cliphist list | fuzzel --dmenu | cliphist decode | wl-copy
  ;;

*"Monitor del sistema"*)
  kitty -e btop
  ;;

*"Bloquear"*)
  swaylock
  ;;

*"Apagar / Salir"*)
  wlogout
  ;;
esac
