#!/usr/bin/env bash

menu() {
  printf "󰖩  Escanear redes\n"
  printf "󰖪  Desconectar WiFi\n"
  printf "󰤭  Activar/Desactivar WiFi\n"
  printf "󰒓  Configuración avanzada\n"
  printf "\n"

  nmcli -t -f active,ssid,signal,security dev wifi list |
    awk -F: '
        $2 != "" {
            icon = $1 == "yes" ? "󰤨" : "󰖩"
            lock = $4 != "" ? "" : ""
            printf "%s  %s  %s%%  %s\n", icon, $2, $3, lock
        }'
}

choice=$(menu | fuzzel --dmenu --prompt="Redes > " --width=46 --lines=14)

case "$choice" in
*"Escanear redes"*)
  notify-send "Redes" "Escaneando redes WiFi..."
  nmcli dev wifi rescan
  ;;

*"Desconectar WiFi"*)
  nmcli device disconnect wlan0 2>/dev/null || nmcli radio wifi off
  notify-send "Redes" "WiFi desconectado"
  ;;

*"Activar/Desactivar WiFi"*)
  state=$(nmcli radio wifi)
  if [ "$state" = "enabled" ]; then
    nmcli radio wifi off
    notify-send "Redes" "WiFi desactivado"
  else
    nmcli radio wifi on
    notify-send "Redes" "WiFi activado"
  fi
  ;;

*"Configuración avanzada"*)
  nm-connection-editor
  ;;

"")
  exit 0
  ;;

*)
  ssid=$(echo "$choice" | sed -E 's/^[^ ]+  //' | awk '{
            out="";
            for (i=1; i<=NF-2; i++) out=out $i " ";
            print substr(out, 1, length(out)-1)
        }')

  if [ -z "$ssid" ]; then
    exit 0
  fi

  if nmcli connection show "$ssid" >/dev/null 2>&1; then
    nmcli connection up "$ssid"
    notify-send "Redes" "Conectado a $ssid"
  else
    password=$(yad --entry \
      --title="Contraseña WiFi" \
      --text="Contraseña para $ssid" \
      --hide-text \
      --width=360)

    if [ -n "$password" ]; then
      nmcli dev wifi connect "$ssid" password "$password" &&
        notify-send "Redes" "Conectado a $ssid" ||
        notify-send "Redes" "No se pudo conectar a $ssid"
    fi
  fi
  ;;
esac
