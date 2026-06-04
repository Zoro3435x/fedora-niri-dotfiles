#!/usr/bin/env bash

if eww active-windows | grep -q dev_panel; then
  eww close dev_panel
else
  eww open dev_panel
fi
