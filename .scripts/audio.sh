#!/bin/sh

id=20
partition=24
delta=$((100 / partition))

function get_volume() {
  pamixer --get-volume
}

function make_bar() {
  index=$(($(get_volume) / delta))
  if [ $index -gt 0 ] ; then
    echo $(expr substr "▁▁▁▂▂▂▃▃▃▄▄▄▅▅▅▆▆▆▇▇▇███" 1 $index)
  else echo "muted"; fi
}

function notify() {
  if ps ax | grep -v grep | grep "dunst" > /dev/null; then
    dunstify -u low -i $1 -r $id $2
  fi
}

case $1 in
mute)
  pamixer -t
  muted=$(pamixer --get-mute)
  echo $muted
  if $muted; then
    notify "volume_off" "muted"
  else
    notify "volume_up" "$(make_bar)"
  fi
  ;;
down)
  pamixer -d $delta
  if [ $(get_volume) == 0 ] ; then
    pamixer -m
    notify "volume_off" "muted"
  else
    notify "volume_down" "$(make_bar)"
  fi
  ;;
up)
  pamixer -u
  pamixer -i $delta
  notify "volume_up" "$(make_bar)"
  ;;
micmute)
  pactl set-source-mute @DEFAULT_SOURCE@ toggle
  ismuted=$(pactl list | grep -E "Name: $DEFAULT_SOURCE$|Mute" | tail -1 |cut -d: -f2| tr -d " ")
  if [ $ismuted == "no" ]; then
    notify "mic" "mic on"
  else
    notify "mic_off" "mic off"
  fi
  ;;
esac
