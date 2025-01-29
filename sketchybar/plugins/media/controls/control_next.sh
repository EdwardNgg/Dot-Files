#!/bin/bash

source "$CONFIG_DIR/themes/icons.sh"

set_next_icon() {
  DISC_NUMBER=$(nowplaying-cli get discNumber)
  if [[ $DISC_NUMBER != "null" ]]; then
    ICON=$SKIP_NEXT
  else
    ICON=$FAST_FORWARD
  fi

  sketchybar --set $NAME icon=$ICON
}

forward_next() {
  DISC_NUMBER=$(nowplaying-cli get discNumber)
  if [[ $DISC_NUMBER != "null" ]]; then
    nowplaying-cli next
  else
    ELAPSED_TIME=$(nowplaying-cli get elapsedTime)
    REWIND_TIME=$(echo "$ELAPSED_TIME + 10" | bc)

    nowplaying-cli seek "$REWIND_TIME"
  fi
}

case $SENDER in
  "mouse.clicked" )
    forward_next
    ;;
  "media_change" )
    set_next_icon
    ;;
esac