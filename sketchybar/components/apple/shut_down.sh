#!/bin/bash

shut_down=(
  label="Shut Down"
  icon=$POWER_OFF
  script="$PLUGIN_DIR/apple/shut_down.sh"
)
sketchybar --add item shut_down popup.apple \
           --set shut_down "${shut_down[@]}" "${menu_item[@]}" \
           --subscribe shut_down mouse.clicked
