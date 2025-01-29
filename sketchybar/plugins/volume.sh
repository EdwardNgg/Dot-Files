#!/bin/bash

VOLUME_SENDER=$SENDER
SENDER="volume"

source "$CONFIG_DIR/themes/icons.sh"
source "$CONFIG_DIR/plugins/volume/volume_popup.sh"
source "$CONFIG_DIR/plugins/volume/volume_slider.sh"

handle_volume_mouse_clicked() {
  BUTTON_CODE=$(echo $INFO | jq ".button_code")

  case $BUTTON_CODE in
    0 )
      toggle_slider_opened
      ;;
    1 )
      toggle_volume_popup
      ;;
  esac
}

set_volume_icon() {
  VOLUME_PERCENT=$INFO

  case $VOLUME_PERCENT in
    6[7-9]|[7-9][0-9]|100 )
      ICON=$VOLUME_FULL
      ;;
    3[4-9]|[4-5][0-9]|6[0-6] )
      ICON=$VOLUME_LOW
      ;;
    [1-9]|[1-2][0-9]|3[0-3] )
      ICON=$VOLUME
      ;;
    * )
      ICON=$VOLUME_MUTE
      ;;
  esac

  sketchybar --set $NAME icon=$ICON label="$VOLUME_PERCENT%"
}

case $VOLUME_SENDER in
  "volume_change" )
    set_volume_icon
    ;;
  "mouse.clicked" )
    handle_volume_mouse_clicked
    ;;
esac
