#!/bin/bash
if [ -z $1 ]; then
  echo must enter a year first
  exit 1
fi
if [ -z $2 ]; then
  echo must enter a storm name second
  exit 1
fi
git add $1/$2
git commit -m "Adding $1 $2"
git push origin master
