#!/bin/bash

artist=(
  width=0
  padding_left=0
  padding_right=0
  y_offset=28
  icon.drawing=false
  label.font="Fira Sans:Regular:12.0"
  script="$PLUGIN_DIR/media/artist.sh"
)
sketchybar --add item artist popup.media \
           --set artist "${artist[@]}" \
           --subscribe artist media_change
