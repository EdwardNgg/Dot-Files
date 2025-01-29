#!/bin/bash

set_front_app_name() {
  sketchybar --set $NAME label="$INFO"
}

case $SENDER in
  "front_app_switched" )
    set_front_app_name
    ;;
esac
