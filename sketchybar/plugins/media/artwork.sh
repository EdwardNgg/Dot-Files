#!/bin/bash

get_artwork_height() {
  ARTWORK_QUERY=$(sketchybar --query artwork)
  echo $(echo $ARTWORK_QUERY | jq ".bounding_rects.\"display-1\".size[1]")
}

get_artwork_width() {
  echo $(sketchybar --query artwork | jq ".bounding_rects.\"display-1\".size[0]")
}

scale_artwork() {
  # Check if the bounding size of artwork has been updated.
  while [[ $(get_artwork_width) == "1.000000" ]]; do
    sleep 1
  done

  ARTWORK_WIDTH=$(get_artwork_width)
  ARTWORK_WIDTH=${ARTWORK_WIDTH%.*}

  SCRUB_WIDTH=310

  DIFFERENCE=$(($SCRUB_WIDTH - $ARTWORK_WIDTH))

  if [[ ${DIFFERENCE#-} -gt 1 ]]; then
    # Get the artwork width at 1.0 scale
    sketchybar --set artwork background.image.scale=1.0
    ARTWORK_WIDTH=$(get_artwork_width)

    if [[ $ARTWORK_WIDTH == "0" ]]; then
      exit
    fi

    # Set the new scale of the artwork to be the width of the scrub.
    SCALE=$(echo "scale=2; $SCRUB_WIDTH / $ARTWORK_WIDTH" | bc)
    sketchybar --set artwork background.image.scale=$SCALE
    
    # Set the new height of the image to add 24px of padding to the top and
    # bottom of the artwork.
    sketchybar --set artwork background.height=1
    ARTWORK_HEIGHT=$(get_artwork_height)
    sketchybar --set artwork background.height=$((${ARTWORK_HEIGHT%.*} + 48))
  fi
}

case $SENDER in
  "media_change" )
    
    ;;
esac
