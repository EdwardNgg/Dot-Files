#!/bin/bash

control_next=(
  icon=$SKIP_NEXT
  icon.font.size=36
  icon.align=center
  icon.padding_left=0
  icon.padding_right=0
  background.drawing=false
  padding_left=0
  padding_right=104
  y_offset=-42
  script="$PLUGIN_DIR/media/controls/control_next.sh"
)

sketchybar --add item control_next popup.media \
           --set control_next "${control_next[@]}" \
           --subscribe control_next mouse.clicked \
                                    media_change

