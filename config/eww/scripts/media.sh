#!/usr/bin/env bash

case "$1" in
title)
  playerctl metadata title 2>/dev/null | cut -c1-28
  ;;

artist)
  playerctl metadata artist 2>/dev/null | cut -c1-28
  ;;

status)
  playerctl status 2>/dev/null || echo "Stopped"
  ;;

icon)
  status=$(playerctl status 2>/dev/null)
  if [ "$status" = "Playing" ]; then
    echo ""
  else
    echo ""
  fi
  ;;

playpause)
  playerctl play-pause
  ;;

next)
  playerctl next
  ;;

previous)
  playerctl previous
  ;;
esac
