#!/usr/bin/env bash

pkill waybar

sleep 0.3

waybar &

waybar -c "$HOME/.config/waybar/dock/config.jsonc" -s "$HOME/.config/waybar/dock/style.css" &
