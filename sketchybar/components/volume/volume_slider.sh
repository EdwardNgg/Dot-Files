#!/bin/bash

volume_slider=(
  script="$PLUGIN_DIR/volume/volume_slider.sh"
  padding_left=0
  padding_right=0
  label.drawing=false
  icon.drawing=false
)
sketchybar --add slider volume_slider right 0 \
           --set volume_slider "${volume_slider[@]}" \
           --subscribe volume_slider volume_change \
                                     mouse.clicked 
