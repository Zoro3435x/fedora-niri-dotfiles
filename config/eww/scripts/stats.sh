#!/usr/bin/env bash

case "$1" in
cpu)
  awk '
      /cpu / {
        idle=$5
        total=$2+$3+$4+$5+$6+$7+$8
        if (last_total != "") {
          diff_idle=idle-last_idle
          diff_total=total-last_total
          usage=(1000*(diff_total-diff_idle)/diff_total+5)/10
          printf "%d\n", usage
        } else {
          print 0
        }
        last_idle=idle
        last_total=total
      }
    ' /proc/stat
  ;;

ram)
  free | awk '/Mem:/ {printf "%d\n", $3/$2*100}'
  ;;

temp)
  for zone in /sys/class/thermal/thermal_zone*/temp; do
    [ -f "$zone" ] || continue
    value=$(cat "$zone")
    if [ "$value" -gt 10000 ] 2>/dev/null; then
      temp=$((value / 1000))
      if [ "$temp" -gt 10 ] && [ "$temp" -lt 120 ]; then
        echo "$temp"
        exit 0
      fi
    fi
  done

  sensors 2>/dev/null | awk '
      /Tctl:|Package id 0:|edge:|temp1:/ {
        gsub(/[+°C]/, "", $2)
        printf "%d\n", $2
        exit
      }
    '
  ;;
volume)
  wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{
      for (i=1; i<=NF; i++) {
        if ($i ~ /^[0-9.]+$/) {
          printf "%d\n", $i * 100
          exit
        }
      }
    }'
  ;;
esac
