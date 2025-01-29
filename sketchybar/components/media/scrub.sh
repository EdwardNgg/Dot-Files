#!/bin/bash

scrub=(
  width=0
  y_offset=-12
  icon.drawing=true
  icon.font="Fira Sans:Bold:10.0"
  icon.width=32
  icon.align=center
  icon.padding_left=8
  icon.padding_right=8
  label.drawing=true
  label.font="Fira Sans:Bold:10.0"
  label.width=32
  label.align=center
  label.padding_left=8
  label.padding_right=8
  background.drawing=true
  background.height=40
  slider.width=208
  slider.background.padding_left=8
  slider.background.padding_right=8
  script="$PLUGIN_DIR/media/scrub.sh"
  update_freq=1
  updates=when_shown
)
sketchybar --add slider scrub popup.media \
           --set scrub "${scrub[@]}" \
           --subscribe scrub media_change \
                             mouse.clicked
