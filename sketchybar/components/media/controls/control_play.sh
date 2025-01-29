#!/bin/bash

control_play=(
  icon=$PLAY_CIRCLE
  icon.font.size=42
  icon.padding_left=0
  icon.padding_right=0
  icon.align=center
  background.drawing=false
  width=35
  padding_left=16
  padding_right=16
  y_offset=-42
  script="$PLUGIN_DIR/media/controls/control_play.sh"
)
sketchybar --add item control_play popup.media \
           --set control_play "${control_play[@]}" \
           --subscribe control_play mouse.clicked \
                                    media_change 
