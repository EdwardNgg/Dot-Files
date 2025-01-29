#!/bin/bash

media=(
  icon=$EQUALIZER
  label.drawing=false
  popup.height=150
  popup.align=center
  popup.horizontal=true
  script="$PLUGIN_DIR/media.sh"
  update_freq=3
)

sketchybar --add item media right \
           --set media "${media[@]}" \
           --subscribe media media_change \
                             mouse.clicked \
                             mouse.entered \
                             front_app_switched \
                             space_change \
                             space_windows_change \
                             display_change \

source "$COMPONENT_DIR/media/artwork.sh"
source "$COMPONENT_DIR/media/title.sh"
source "$COMPONENT_DIR/media/artist.sh"
source "$COMPONENT_DIR/media/scrub.sh"
source "$COMPONENT_DIR/media/controls.sh"
