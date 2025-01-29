#!/bin/bash

toggle_apple_menu() {
  sketchybar --set apple popup.drawing=toggle
}

hide_apple_menu() {
  sketchybar --set apple popup.drawing=false
}

case $SENDER in
  "front_app_switched" | "space_change" | "space_windows_change" | "display_change" )
    hide_apple_menu
    ;;
  "mouse.clicked" )
    toggle_apple_menu
    ;;
esac
