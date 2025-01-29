#!/bin/bash

chevron=(
  icon=$CHEVRON_RIGHT
  label.drawing=false
  padding_right=4
)
front_app=(
  icon.drawing=false
  script="$PLUGIN_DIR/front_app.sh"
  padding_left=4
)

sketchybar --add item chevron left \
           --set chevron "${chevron[@]}" \
           --add item front_app left \
           --set front_app "${front_app[@]}" \
           --subscribe front_app front_app_switched
