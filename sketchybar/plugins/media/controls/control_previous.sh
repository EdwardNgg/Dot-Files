#!/bin/bash

source "$CONFIG_DIR/themes/icons.sh"

set_previous_icon() {
  DISC_NUMBER=$(nowplaying-cli get discNumber)
  if [[ $DISC_NUMBER != "null" ]]; then
    ICON=$SKIP_PREVIOUS
  else
    ICON=$REWIND
  fi

  sketchybar --set $NAME icon=$ICON
}

rewind_previous() {
  DISC_NUMBER=$(nowplaying-cli get discNumber)
  if [[ $DISC_NUMBER != "null" ]]; then
    nowplaying-cli previous
  else
    ELAPSED_TIME=$(nowplaying-cli get elapsedTime)
    REWIND_TIME=$(echo "$ELAPSED_TIME - 10" | bc)

    nowplaying-cli seek "$REWIND_TIME"
  fi
}

case $SENDER in
  "mouse.clicked" )
    rewind_previous
    ;;
  "media_change" )
    set_previous_icon
    ;;
esac