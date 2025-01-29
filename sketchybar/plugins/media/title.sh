#!/bin/bash

set_title() {
  TITLE=$(echo "$INFO" | jq -r ".title")

  if [[ ${#TITLE} -gt 30 ]]; then
    TITLE="${TITLE::30}..."
  fi

  sketchybar --set title label="$TITLE"
}

case $SENDER in
  "media_change" )
    set_title
    ;;
esac
