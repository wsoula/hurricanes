#!/bin/bash
./getRawData.sh $1 $2
./convert-raw-data-to-csv.sh $1/$2/$1-$2-no-leading-space $1/$2/$1-$2
./convert-csv-to-geojson.sh $1/$2/$1-$2.csv $1/$2/$1-$2.geojson
./addDataFiles.sh $1/$2/$1 $1/$2/$2
