#!/bin/bash
# define the input folder and filemask
INPUT_FOLDER="./in/*.*"
OUTPUT_FOLDER="./out"
FILETYPE="avi"
OPTIONS="-vcodec libx264 -vf scale="800:480" -b:v 600k -r 30"

# No changes beyond this line!
mkdir $OUTPUT_FOLDER

for f in $INPUT_FOLDER;
do
  FILENAME=$(echo ${f##*\/} | cut -d. -f1);
  ffmpeg  -i $f $OPTIONS $OUTPUT_FOLDER/$FILENAME.$FILETYPE;  
  echo $FILENAME;
done