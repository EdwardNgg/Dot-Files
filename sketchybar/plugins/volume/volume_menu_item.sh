#!/bin/bash

source "$CONFIG_DIR/themes/colors.sh"

change_device() {
  ID=$(echo $NAME | tr -d "volume_device")
  SwitchAudioSource -i $ID
  sketchybar --set /volume_device_/ background.color=$PRIMARY
  sketchybar --set "volume_device_$ID" background.color=$PRIMARY_CONTAINER
}


case $SENDER in
  "mouse.clicked" )
    change_device
    ;;
esac
