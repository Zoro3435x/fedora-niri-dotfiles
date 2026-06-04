#!/usr/bin/env bash

if eww active-windows | grep -q audio_panel; then
  eww close audio_panel
else
  eww open audio_panel
fi
