#!/bin/bash
set -ex
./getRawData.sh $1 $2
./convert-raw-data-to-csv.sh $1/$2/$1-$2-no-leading-space $1/$2/$1-$2
./convert-csv-to-geojson.sh $1/$2/$1-$2.csv $1/$2/$1-$2.geojson
echo "<center>" >> hurricanes.html
echo "<h3>$2 $1 </h3>" >> hurricanes.html
echo "<script src=\"https://embed.github.com/view/geojson/wsoula/hurricanes/master/$1/$2/$1-$2.geojson\"></script>" >> hurricanes.html
echo "</center>" >> hurricanes.html
./addDataFiles.sh $1 $2
