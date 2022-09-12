#!/bin/bash

rm videos.txt
rm out-*.webm

HEIGHT=1024

for (( c = $HEIGHT; c >= 1; c -= 2 ))
do
	printf -v name "%05d" $((( $HEIGHT - $c )))
	ffmpeg -y -i ./jap-sunset-transformed.png -vf "crop=1024:$c:0:0" "out-$name.webm"
done

for f in out-*.webm; do echo "file '$f'" >> videos.txt; done

ffmpeg -y -f concat -i videos.txt -c copy total.webm

