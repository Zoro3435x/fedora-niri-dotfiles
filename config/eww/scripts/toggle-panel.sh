#!/usr/bin/env bash

if eww active-windows | grep -q quick_panel; then
  eww close quick_panel
else
  eww open quick_panel
fi
