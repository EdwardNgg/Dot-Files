#!/bin/bash

artwork=(
  icon.drawing=false
  label.drawing=false
  padding_left=16
  padding_right=16
  background.drawing=true
  background.image=media.artwork
  background.image.drawing=true
  background.image.scale=3.6
  background.image.corner_radius=8
)
sketchybar --add item artwork popup.media \
           --set artwork "${artwork[@]}" \
           --subscribe artwork media_change
