#!/bin/sh

dir=$HOME/icons/google-material
mkdir -p $dir

cd ./material-design-icons/src
for category in $(ls); do
  cd $category
  for icon in $(ls); do
    cat $icon/materialicons$1/24px.svg >$dir/$icon.svg
    if [ $# -gt 1 ]; then
      sed -i "s/\/><\/svg>/ fill=\"$2\"\/><\/svg>/g" $dir/$icon.svg
    fi
  done
  cd ..
done
