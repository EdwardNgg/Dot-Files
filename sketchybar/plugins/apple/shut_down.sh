#!/bin/bash

SHUT_DOWN_SENDER=$SENDER
SENDER="shutdown"

source "$CONFIG_DIR/plugins/apple.sh"

open_shut_down() {
  osascript -e 'tell app "loginwindow" to «event aevtrsdn»'
}

case $SHUT_DOWN_SENDER in
  "mouse.clicked" )
    open_shut_down
    hide_apple_menu
    ;;
esac
