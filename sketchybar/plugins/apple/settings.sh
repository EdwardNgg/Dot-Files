#!/bin/bash

SETTINGS_SENDER=$SENDER
SENDER="settings"

source "$CONFIG_DIR/plugins/apple.sh"

open_settings() {
  open -a "System Settings"
}

case $SETTINGS_SENDER in
  "mouse.clicked" )
    open_settings
    hide_apple_menu
    ;;
esac
