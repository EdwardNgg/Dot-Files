#!/bin/bash

restart=(
  label="Restart"
  icon=$REVISION
  script="$PLUGIN_DIR/apple/restart.sh"
)
sketchybar --add item restart popup.apple \
           --set restart "${restart[@]}" "${menu_item[@]}" \
           --subscribe restart mouse.clicked
