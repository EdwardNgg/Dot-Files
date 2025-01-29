#!/bin/bash

source "$CONFIG_DIR/themes/components/menu_item.sh"
source "$CONFIG_DIR/themes/colors.sh"
source "$CONFIG_DIR/themes/icons.sh"

current_item=(
  background.color=$PRIMARY_CONTAINER
)
volume_item=(
  width=280
  padding_left=0
  padding_right=0
  background.color=$PRIMARY
  background.corner_radius=4
  icon.padding_left=12
  label.padding_right=12
  script="$CONFIG_DIR/plugins/volume/volume_menu_item.sh"
)

toggle_volume_popup() {

  IS_OPEN=$(sketchybar --query volume | jq ".popup.drawing" | tr -d "\"")

  if [[ $IS_OPEN == "on" ]]; then
    sketchybar --set $NAME popup.drawing=off
    sketchybar --remove /volume_device_/
  else
    # Get all current output devices and iterate through each one.
    while read -r line; do
      ID=$(echo $line | jq ".id" | tr -d "\"")
      LABEL=$(echo $line | jq ".name" | tr -d "\"")
      DEVICE_NAME="volume_device_$ID"

      # Determine the type of audio device to set the icon.
      case $(echo $line | jq ".uid" | tr -d "\"") in
        "BuiltInSpeakerDevice" )
          if [[ $(system_profiler SPHardwareDataType | grep "Model Identifier") =~ "MacBook" ]]; then
            ICON=$LAPTOP
          else
            ICON=$DESKTOP
          fi
          ;;
        * )
          ICON=$HEADPHONES
        ;;
      esac

      device=(
        label=$LABEL
        icon=$ICON
      )

      sketchybar --add item $DEVICE_NAME popup.volume \
                 --set $DEVICE_NAME "${menu_item[@]}" "${volume_item[@]}" "${device[@]}" \
                 --subscribe $DEVICE_NAME mouse.clicked
      
    done <<< "$(SwitchAudioSource -a -f json -t output)"

    # Highlight the current audio output device.
    CURRENT_ID=$(SwitchAudioSource -c -f json -t output | jq ".id" | tr -d "\"")
    CURRENT_NAME="volume_device_$CURRENT_ID"
    sketchybar --set $CURRENT_NAME background.color=$PRIMARY_CONTAINER

    sketchybar --set $NAME popup.drawing=on
  fi
}
