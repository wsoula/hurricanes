#!/bin/bash
if [ -z $1 ]; then
  echo must enter an input file
  exit 1
fi
if [ -z $2 ]; then
  echo must enter a destination file
  exit 1
fi
file=$2
echo "{">$file
echo "\"type\": \"FeatureCollection\",">>$file
echo "\"features\": [">>$file
count=1
total=0
while IFS=, read col1
do
  total=$((total+1))
done < $1
while IFS=, read col1 col2 col3 col4 col5 col6 col7
do
  if [ "$count" -gt "1" ]; then
    echo "{ \"type\": \"Feature\", \"properties\": { \"ADV\": \"$col1\", \"LAT\": \"$col2\", \"LON\": \"$col3\", \"TIME\": \"$col4\", \"WIND\": \"$col5\", \"PR\": \"$col6\", \"STAT\": \"$col7\", \"NAME\": \"$2\", \"DATES\": \"$col4\" }, \"geometry\": { \"type\": \"Point\", \"coordinates\": [ $col3, $col2 ] } }">>$file
  fi
  if [ "$count" -gt "1" -a "$count" -ne "$total" ]; then
    echo ",">>$file
  fi
  count=$((count+1))
done < $1
echo "">>$file
echo "]">>$file
echo "}">>$file
