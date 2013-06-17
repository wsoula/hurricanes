#!/bin/bash
if [ -z $1 ]; then
  echo must enter a year first
  exit 1
fi
if [ -z $2 ]; then
  echo must enter a storm name second
  exit 1
fi
year=$1
name=$2
dir=$1/$2
mkdir -p $dir
wget http://weather.unisys.com/hurricane/atlantic/$year/$name/track.dat -O $dir/$year-$name-raw-data
cat $dir/$year-$name-raw-data | sed -E "s%^[ ]+%%g">$dir/$year-$name-no-leading-space
