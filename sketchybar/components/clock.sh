#!/bin/bash

clock=(
  icon=$TIME_FIVE
  script="$PLUGIN_DIR/clock.sh"
  update_freq=10
)
sketchybar --add item clock right \
           --set clock "${clock[@]}"
