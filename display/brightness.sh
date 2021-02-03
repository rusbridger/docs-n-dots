#!/bin/sh

id=20
partition=24
delta=$((100 / partition))
min=.7

get_light() {
  echo $(light -G) | awk '{print ($val-int($val)>0)?int($val)+1:int($val)}'
}

make_bar() {
  index=$(($(get_light) / delta))
  if test $index = 0 ; then index=1; fi
  echo $(expr substr "▁▁▁▂▂▂▃▃▃▄▄▄▅▅▅▆▆▆▇▇▇███" 1 $index)
}

notify() {
  if ps ax | grep -v grep | grep "dunst" > /dev/null; then
    dunstify -u low -i $1 -r $id $2
  fi
}

case $1 in
down)
  if test $(get_light) -lt $(($delta + 1)) ; then
    sudo light -S .7
  else sudo light -U $delta; fi
  notify "brightness_low" "$(make_bar)"
  ;;
up)
  sudo light -A $delta
  notify "brightness_high" "$(make_bar)"
  ;;
esac

