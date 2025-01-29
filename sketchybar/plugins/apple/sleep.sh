#!/bin/bash

SLEEP_SENDER=$SENDER
SENDER="sleep"

source "$CONFIG_DIR/plugins/apple.sh"

sleep() {
  pmset sleepnow
}

case $SLEEP_SENDER in
  "mouse.clicked" )
    hide_apple_menu
    sleep
    ;;
esac
