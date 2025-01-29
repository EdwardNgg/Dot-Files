#!/bin/bash

source "$COMPONENT_DIR/volume/volume_slider.sh"


sketchybar --add item volume right \
           --set volume script="$PLUGIN_DIR/volume.sh" \
           --set volume popup.align=center \
           --subscribe volume volume_change \
                              mouse.clicked \
