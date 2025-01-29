#!/bin/bash

control_previous=(
  icon=$SKIP_PREVIOUS
  icon.font.size=36
  icon.align=center
  icon.padding_left=0
  icon.padding_right=0
  background.drawing=false
  padding_left=64
  padding_right=0
  y_offset=-42
  script="$PLUGIN_DIR/media/controls/control_previous.sh"
)
sketchybar --add item control_previous popup.media \
           --set control_previous "${control_previous[@]}" \
           --subscribe control_previous mouse.clicked \
                                        media_change
