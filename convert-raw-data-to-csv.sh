#!/bin/bash
if [ -z $1 ]; then
  echo must enter a file to convert
  exit 1
fi
if [ -z $2 ]; then
  echo must enter a filename to save as
  exit 1
fi
cat $1 | sed -E "s%[ ]+%,%g" > $2.csv
