#!/bin/bash

source "$CONFIG_DIR/themes/icons.sh"

get_time_string() {
  TIME=$1
  TIME_STRING=$(date -r "${TIME%.*}" -u +%H:%M:%S)

  # If the time is not longer than an hour.
  if [[ "${TIME_STRING::2}" == "00" ]]; then
    # Remove the hour from the time string.
    TIME_STRING="${TIME_STRING:3:5}"
  fi

  echo "$TIME_STRING"
}

update_elapsed_time() {
  ELAPSED_TIME=$(nowplaying-cli get elapsedTime)
    
  DURATION=$(nowplaying-cli get duration)

  if [[ $ELAPSED_TIME == "null" || $DURATION == "null" || $DURATION == "0" ]]; then
    exit
  fi

  PERCENTAGE_RAW="$(echo "scale=2; $ELAPSED_TIME / $DURATION * 100" | bc)"
  PERCENTAGE="${PERCENTAGE_RAW%.*}"

  ELAPSED_TIME_STRING=$(get_time_string "$ELAPSED_TIME")

  scrub=(
    icon="$ELAPSED_TIME_STRING"
    slider.percentage=$PERCENTAGE
  )
  sketchybar --set $NAME "${scrub[@]}"

}

set_duration() {
  DURATION=$(nowplaying-cli get duration)

  if [[ $DURATION == "null" ]]; then
    exit
  fi

  DURATION_STRING=$(get_time_string "$DURATION")
  sketchybar --set $NAME label="$DURATION_STRING"
}

seek() {
  DURATION=$(nowplaying-cli get duration)
  SEEK_RAW=$(echo "scale=2; $PERCENTAGE / 100 * $DURATION" | bc)
  SEEK_TIME=${SEEK_RAW%.*}

  nowplaying-cli seek "$SEEK_TIME"
  
  for ((i = 0; i < 16; i++)); do
    sketchybar --set $NAME slider.percentage=$PERCENTAGE
  done

  update_elapsed_time
}

case $SENDER in
  "media_change" )
    set_duration
    ;;
  "routine" )
    update_elapsed_time
    set_duration
    ;;
  "mouse.clicked" )
    seek
    ;;
esac
