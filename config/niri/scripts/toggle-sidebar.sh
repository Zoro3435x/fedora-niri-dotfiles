#!/usr/bin/env bash

LEFT_CONFIG="$HOME/.config/waybar/sidebar-left/config.jsonc"
LEFT_STYLE="$HOME/.config/waybar/sidebar-left/style.css"

RIGHT_CONFIG="$HOME/.config/waybar/sidebar-right/config.jsonc"
RIGHT_STYLE="$HOME/.config/waybar/sidebar-right/style.css"

if pgrep -af "waybar.*sidebar-left/config.jsonc" >/dev/null || pgrep -af "waybar.*sidebar-right/config.jsonc" >/dev/null; then
  pkill -f "waybar.*sidebar-left/config.jsonc"
  pkill -f "waybar.*sidebar-right/config.jsonc"
else
  waybar -c "$LEFT_CONFIG" -s "$LEFT_STYLE" &
  waybar -c "$RIGHT_CONFIG" -s "$RIGHT_STYLE" &
fi
