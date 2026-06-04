#!/usr/bin/env bash

CONFIG="$HOME/.config/waybar/dock/config.jsonc"
STYLE="$HOME/.config/waybar/dock/style.css"

if pgrep -af "waybar.*dock/config.jsonc" >/dev/null; then
  pkill -f "waybar.*dock/config.jsonc"
else
  waybar -c "$CONFIG" -s "$STYLE" &
fi
