#!/bin/bash

source "$CONFIG_DIR/themes/icons.sh"

get_wifi_info() {
  CURRENT_NETWORK=$(system_profiler SPAirPortDataType | grep -m 1 -A 9 "Current Network")
  if [[ -n $CURRENT_NETWORK ]]; then
    SSID=$(echo "$CURRENT_NETWORK" | head -n 2 | tail -n 1 | sed "s/^            //" | sed "s/:$//")
    RSSI=$(echo "$CURRENT_NETWORK" | grep "Signal" | sed "s/.*: //" | sed "s/ .*//")
  else
    SSID=""
    RSSI="0"
  fi
}

set_wifi_icon() {
  case $RSSI in
    -[3-5][0-9] )
      ICON=$WIFI
      ;;
    -6[0-9] )
      ICON=$WIFI_2
      ;;
    -7[0-9] )
      ICON=$WIFI_1
      ;;
    -8[0-9]|-90 )
      ICON=$WIFI_0
      ;;
    * )
      ICON=$WIFI_OFF
      ;;
  esac

  sketchybar --set $NAME icon=$ICON
}

set_wifi_label() {
  sketchybar --set $NAME label=$SSID
}


get_wifi_info
set_wifi_icon
set_wifi_label
