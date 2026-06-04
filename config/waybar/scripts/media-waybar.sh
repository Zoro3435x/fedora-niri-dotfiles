#!/usr/bin/env bash

status=$(playerctl status 2>/dev/null)

if [ "$status" = "Playing" ]; then
  artist=$(playerctl metadata artist 2>/dev/null | cut -c1-22)
  title=$(playerctl metadata title 2>/dev/null | cut -c1-28)

  if [ -n "$artist" ] && [ -n "$title" ]; then
    echo "  $title - $artist"
  elif [ -n "$title" ]; then
    echo "  $title"
  else
    echo ""
  fi
else
  echo ""
fi
