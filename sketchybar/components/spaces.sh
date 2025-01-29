#!/bin/bash

# Space navigation requires that keyboard shortcuts for mission control to be
# enabled. 

keycodes=(29 18 19 20 21 23 22 26 28 25)

for i in {1..16}; do
  # Determine the keyboard shortcut for changing spaces.
  KEYCODE="${keycodes[$(($i % 10))]}"

  MODIFIER="control down"
  if [[ i -gt 10 ]]; then
    MODIFIER="$MODIFIER, option down"
  fi

  CLICK_SCRIPT="osascript -e 'tell application \"System Events\" to key code \
      $KEYCODE using {$MODIFIER}'"
  
  space=(
    space=$i
    icon=$i
    padding_left=4
    padding_right=4
    icon.font="Fira Sans:Bold:14.0"
    icon.padding_left=8
    icon.padding_right=8
    background.color=$PRIMARY
    background.corner_radius=4
    background.height=24
    label.drawing=false
    click_script=$CLICK_SCRIPT
    script="$PLUGIN_DIR/space.sh"
  )
  sketchybar --add space space_$i left\
             --set space_$i "${space[@]}"
done