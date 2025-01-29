#!/bin/bash

source "$CONFIG_DIR/themes/icons.sh"

check_battery() {
  IS_BATTERY=$(pmset -g batt | grep "id")

  if [[ -z $IS_BATTERY ]]; then
    battery=(
      update_freq=0
      drawing=false
    )
    sketchybar --set $NAME "${battery[@]}"
    exit
  fi
}

get_battery_info() {
  BATTERY_PERCENT="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
  CHARGING=$(pmset -g batt | grep "AC Power")
}

set_battery_icon() {
  if [[ -z $CHARGING ]]; then
    case $BATTERY_PERCENT in
      6[7-9]|[7-9][0-9]|100 )
        ICON=$BATTERY_FULL
        ;;
      3[4-9]|[4-5][0-9]|6[0-6] )
        ICON=$BATTERY_LOW
        ;;
      * )
        ICON=$BATTERY
        ;;
      esac
  else 
    ICON=$BATTERY_CHARGING
  fi

  sketchybar --set $NAME icon=$ICON
}

set_battery_label() {
  sketchybar --set $NAME label="$BATTERY_PERCENT%"
}

check_battery
get_battery_info
set_battery_icon
set_battery_label
