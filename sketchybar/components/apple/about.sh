#!/bin/bash

about=(
  label="About This Mac"
  icon=$INFO_CIRCLE
  script="$PLUGIN_DIR/apple/about.sh"
)
sketchybar --add item about popup.apple \
           --set about "${about[@]}" "${menu_item[@]}" \
           --subscribe about mouse.clicked
