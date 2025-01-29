#!/bin/bash

wifi=(
  script="$PLUGIN_DIR/wifi.sh"
  update_freq=120
)
sketchybar --add item wifi right \
           --set wifi "${wifi[@]}" \
           --subscribe wifi wifi_change
