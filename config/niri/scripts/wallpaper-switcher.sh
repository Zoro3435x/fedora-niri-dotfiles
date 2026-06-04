#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
CURRENT_LINK="$HOME/.config/niri/wallpaper.jpg"

selected=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) |
  sed "s|$WALLPAPER_DIR/||" |
  sort |
  fuzzel --dmenu --prompt="Wallpaper > " --width=45 --lines=12)

[ -z "$selected" ] && exit 0

wallpaper="$WALLPAPER_DIR/$selected"

pkill swaybg

swaybg -i "$wallpaper" -m fill >/tmp/swaybg.log 2>&1 &

cp "$wallpaper" "$CURRENT_LINK"

notify-send "Wallpaper" "Fondo actualizado: $selected"
