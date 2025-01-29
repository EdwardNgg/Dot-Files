#!/bin/bash

settings=(
  label="System Settings"
  icon=$COG
  script="$PLUGIN_DIR/apple/settings.sh"
)
sketchybar --add item settings popup.apple \
           --set settings "${settings[@]}" "${menu_item[@]}" \
           --subscribe settings mouse.clicked
