#!/bin/bash

MEDIA_SENDER=$SENDER
SENDER="media"

source "$CONFIG_DIR/plugins/media/artwork.sh"

toggle_media_menu() {
  sketchybar --set $NAME popup.drawing=toggle
}

toggle_media_icon() {
  TITLE=$(nowplaying-cli get-raw)
  
  if [[ $TITLE == "(null)" ]]; then
    sketchybar --set $NAME drawing=false
  else
    sketchybar --set $NAME drawing=true
  fi
}

show_media_icon() {
  sketchybar --set $NAME drawing=true
}

set_scrub_updates() {
  STATE=$(echo $INFO | jq ".state")
  if [[ $STATE == "\"playing\"" ]]; then
    sketchybar --set scrub updates=when_shown
  else
    sketchybar --set scrub updates=false
  fi
}

case $MEDIA_SENDER in
  "mouse.clicked" )
    toggle_media_menu
    ;;
  "media_change" )
    show_media_icon
    set_scrub_updates
    ;;
  "routine" )
    toggle_media_icon
    ;;
esac
