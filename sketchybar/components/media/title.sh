#!/bin/bash

title=(
  width=0
  padding_left=0
  padding_right=0
  y_offset=48
  icon.drawing=false
  label.font.size=16
  script="$PLUGIN_DIR/media/title.sh"
)
sketchybar --add item title popup.media \
           --set title "${title[@]}" \
           --subscribe title media_change
