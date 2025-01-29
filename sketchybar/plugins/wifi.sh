#!/bin/bash

source "$CONFIG_DIR/themes/icons.sh"

get_wifi_info() {
  # Determine if there is an active ethernet network.
  IS_ETHERNET="off"
  ETHERNET_DEVICES=$(networksetup -listnetworkserviceorder | grep "Hardware Port: Ethernet" | sed "s/.*Device: //" | sed "s/)//")
  for DEVICE in $ETHERNET_DEVICES; do
    echo "ifconfig $DEVICE"
    STATUS=$(ifconfig $DEVICE | grep "status" | sed "s/.*status: //")

    if [[ $STATUS == "active" ]]; then
      IS_ETHERNET="on"
      return 0
    fi

  done <<< "$(echo $ETHERNET_DEVICES)"

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
  if [[ $IS_ETHERNET == "on" ]]; then
    ICON=$SITEMAP
  else
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
  fi

  sketchybar --set $NAME icon=$ICON
}

set_wifi_label() {
  if [[ $IS_ETHERNET == "on" ]]; then
    SSID="Ethernet"
  fi
  
  sketchybar --set $NAME label=$SSID
}


get_wifi_info
set_wifi_icon
set_wifi_label
