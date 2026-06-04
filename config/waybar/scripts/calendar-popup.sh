#!/usr/bin/env bash

GTK_THEME=Adwaita:dark \
  GTK_CSS_PROVIDER="$HOME/.config/waybar/styles/calendar.css" \
  yad \
  --calendar \
  --undecorated \
  --close-on-unfocus \
  --fixed \
  --width=340 \
  --height=300 \
  --posx=760 \
  --posy=58 \
  --title="Calendar" \
  --borders=14
