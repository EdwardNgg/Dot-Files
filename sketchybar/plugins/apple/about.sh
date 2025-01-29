#!/bin/bash

ABOUT_SENDER=$SENDER
SENDER="about"

source "$CONFIG_DIR/plugins/apple.sh"

open_about() {
  open -a "About This Mac"
}

case $ABOUT_SENDER in
  "mouse.clicked" )
    open_about
    hide_apple_menu
    ;;
esac
