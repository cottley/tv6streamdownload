#!/bin/sh
cd /home/mediacenter/Videos
START=$(date +%s)
BASENAME="tv6stream"

while :
do
  FILENAME="$BASENAME"_`date +%Y-%m-%d_%H%M%S`.flv
  rtmpdump -r rtmp://fml.5C35.edgecastcdn.net/205C35/TV6 \
-a 205C35/TV6 \
-y TV6?TV6 \ -W http://swfs.bimvid.com/bimvid_rtmp-3_2_0.swf?x-bim-callletters=TV6 \
-p http://www.tv6tnt.com \
-f "LNX 11,2,202,228" \
-o $FILENAME \
-v \
-B 10800
  find . -name '*.flv' -size 0 -print0 | xargs -0 rm
  END=$(date +%s)
  DIFF=$(( $END - $START ))
  if [ $DIFF -gt 7200 ]
  then
    break
  fi
done
