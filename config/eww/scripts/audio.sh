#!/usr/bin/env bash

case "$1" in
output-name)
  wpctl inspect @DEFAULT_AUDIO_SINK@ 2>/dev/null |
    awk -F'"' '/node.description/ {print $2; exit}'
  ;;

output-volume)
  wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null | awk '{
      for (i=1; i<=NF; i++) {
        if ($i ~ /^[0-9.]+$/) {
          printf "%d\n", $i * 100
          exit
        }
      }
    }'
  ;;

output-muted)
  wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null | grep -q MUTED &&
    echo "Muted" || echo "On"
  ;;

input-name)
  wpctl inspect @DEFAULT_AUDIO_SOURCE@ 2>/dev/null |
    awk -F'"' '/node.description/ {print $2; exit}'
  ;;

input-volume)
  wpctl get-volume @DEFAULT_AUDIO_SOURCE@ 2>/dev/null | awk '{
      for (i=1; i<=NF; i++) {
        if ($i ~ /^[0-9.]+$/) {
          printf "%d\n", $i * 100
          exit
        }
      }
    }'
  ;;

input-muted)
  wpctl get-volume @DEFAULT_AUDIO_SOURCE@ 2>/dev/null | grep -q MUTED &&
    echo "Muted" || echo "On"
  ;;

toggle-output-mute)
  wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
  ;;

toggle-input-mute)
  wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
  ;;

change-output)
  choice=$(wpctl status | awk '
      /Sinks:/ {in_sinks=1; next}
      /Sources:/ {in_sinks=0}
      in_sinks && /[0-9]+\./ {
        gsub(/[│*]/, "")
        print
      }
    ' | sed 's/^[[:space:]]*//' | fuzzel --dmenu --prompt="Salida > " --width=54 --lines=10)

  [ -z "$choice" ] && exit 0

  id=$(echo "$choice" | awk -F. '{print $1}' | tr -dc '0-9')

  [ -n "$id" ] && wpctl set-default "$id"
  ;;

change-input)
  choice=$(wpctl status | awk '
      /Sources:/ {in_sources=1; next}
      /Filters:/ {in_sources=0}
      in_sources && /[0-9]+\./ {
        gsub(/[│*]/, "")
        print
      }
    ' | sed 's/^[[:space:]]*//' | fuzzel --dmenu --prompt="Entrada > " --width=54 --lines=10)

  [ -z "$choice" ] && exit 0

  id=$(echo "$choice" | awk -F. '{print $1}' | tr -dc '0-9')

  [ -n "$id" ] && wpctl set-default "$id"
  ;;

*)
  echo "N/A"
  ;;
esac
