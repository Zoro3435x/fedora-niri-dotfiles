#!/usr/bin/env bash

pkill waybar

sleep 0.3

waybar >/tmp/waybar-main.log 2>&1 &

waybar -c "$HOME/.config/waybar/dock/config.jsonc" -s "$HOME/.config/waybar/dock/style.css" >/tmp/waybar-dock.log 2>&1 &
