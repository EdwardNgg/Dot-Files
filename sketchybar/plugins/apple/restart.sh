#!/bin/bash

RESTART_SENDER=$SENDER
SENDER="restart"

source "$CONFIG_DIR/plugins/apple.sh"

open_restart() {
  osascript -e 'tell app "loginwindow" to «event aevtrrst»'
}

case $RESTART_SENDER in
  "mouse.clicked" )
    open_restart
    hide_apple_menu
    ;;
esac
