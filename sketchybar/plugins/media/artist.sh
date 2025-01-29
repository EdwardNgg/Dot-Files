#!/bin/bash

set_artist() {
  ARTIST=$(echo "$INFO" | jq -r ".artist")
  sketchybar --set $NAME label="$ARTIST"
}

case $SENDER in
  "media_change" )
    set_artist
    ;;
esac
