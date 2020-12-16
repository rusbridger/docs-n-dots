#!/bin/sh

id=20
partition=24
delta=$((100 / partition))

function get_light() {
  echo $(light -G) | awk '{print ($val-int($val)>0)?int($val)+1:int($val)}'
}

function make_bar() {
  index=$(($(get_light) / delta))
  if [ $index == 0 ]; then index=1; fi
  echo $(expr substr "▁▁▁▂▂▂▃▃▃▄▄▄▅▅▅▆▆▆▇▇▇███" 1 $index)
}

function notify() {
  if ps ax | grep -v grep | grep "dunst" > /dev/null; then
    dunstify -u low -i $1 -r $id $2
  fi
}

case $1 in
down)
  if [ $(get_light) -lt $(($delta + 1)) ]; then
    light -N
  else light -U $delta; fi
  notify "brightness_low" "$(make_bar)"
  ;;
up)
  light -A $delta
  notify "brightness_high" "$(make_bar)"
  ;;
esac

