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
wget http://weather.unisys.com/hurricane/atlantic/$year/$name/track.dat -O $year-$name-raw-data
cat $year-$name-raw-data | sed -E "s%^[ ]+%%g">$year-$name-no-leading-space
