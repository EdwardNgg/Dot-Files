#!/bin/bash

WIDTH=100

toggle_slider_opened() {
  SLIDER_WIDTH=$(sketchybar --query volume_slider | jq -r ".slider.width")

  if [[ $SLIDER_WIDTH == "0" ]]; then
    volume_slider_toggled=(
      slider.width=$WIDTH
      slider.knob.drawing=true
    )
  else 
    volume_slider_toggled=(
      slider.width=0
      slider.knob.drawing=false
    )
  fi

  sketchybar --animate quadratic 18 \
             --set volume_slider "${volume_slider_toggled[@]}"
}

set_volume_slider_value() {
  VOLUME_PERCENT=$INFO

  sketchybar --set volume_slider slider.percentage=$VOLUME_PERCENT
}

set_volume() {
  osascript -e "set volume output volume $PERCENTAGE"
}

case $SENDER in
  "volume_change" )
    set_volume_slider_value
    ;;
  "mouse.clicked" )
    set_volume
    ;;
esac
