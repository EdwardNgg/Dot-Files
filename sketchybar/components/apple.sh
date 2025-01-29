#!/bin/bash

apple=(
  icon=$APPLE
  script="$PLUGIN_DIR/apple.sh"
)
sketchybar --add item apple left \
           --set apple "${apple[@]}" \
           --subscribe apple front_app_switched \
                             space_change \
                             space_windows_change \
                             display_change \
                             mouse.clicked

source "$COMPONENT_DIR/apple/about.sh"
source "$COMPONENT_DIR/apple/settings.sh"
source "$COMPONENT_DIR/apple/sleep.sh"
source "$COMPONENT_DIR/apple/restart.sh"
source "$COMPONENT_DIR/apple/shut_down.sh"
