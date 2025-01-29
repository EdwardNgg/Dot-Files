#!/bin/bash

source "$CONFIG_DIR/themes/icons.sh"

set_play_pause_icon() {
  STATE=$(echo "$INFO" | jq ".state")

  if [[ $STATE == "\"playing\"" ]]; then
    ICON=$PAUSE_CIRCLE
  else
    ICON=$PLAY_CIRCLE
  fi

  sketchybar --set $NAME icon=$ICON
}

play_pause() {
  nowplaying-cli togglePlayPause
}

case $SENDER in
  "mouse.clicked" )
    play_pause
    ;;
  "media_change" )
    set_play_pause_icon
    ;;
esac
