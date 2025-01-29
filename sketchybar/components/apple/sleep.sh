#!/bin/bash

sleep=(
  label="Sleep"
  icon=$MOON
  script="$PLUGIN_DIR/apple/sleep.sh"
)
sketchybar --add item sleep popup.apple \
           --set sleep "${sleep[@]}" "${menu_item[@]}" \
           --subscribe sleep mouse.clicked
