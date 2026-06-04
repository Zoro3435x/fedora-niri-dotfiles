#!/usr/bin/env bash

APP_ID="$1"
shift

COMMAND="$*"

if [ -z "$APP_ID" ] || [ -z "$COMMAND" ]; then
  echo "uso: focus-or-open.sh <app-id> <command>"
  exit 1
fi

WINDOW_ID=$(niri msg --json windows |
  jq -r ".[] | select(.app_id == \"$APP_ID\") | .id" |
  head -n 1)

if [ -n "$WINDOW_ID" ] && [ "$WINDOW_ID" != "null" ]; then
  niri msg action focus-window --id "$WINDOW_ID"
else
  sh -c "$COMMAND" >/tmp/niri-focus-open.log 2>&1 &
fi
