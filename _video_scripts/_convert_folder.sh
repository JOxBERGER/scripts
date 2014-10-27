#!/bin/bash
# define the input folder and filemask
INPUT_FOLDER="./in"
INPUT_MASK="*.*"
OUTPUT_FOLDER="./out"
# FILETYPE="avi"
# OPTIONS="-vcodec libx264 -vf scale="800:480" -b:v 600k -r 30"

# convert to wmv change file type as well!
FILETYPE=WMV
OPTIONS="-vf scale="800:480" -r 30 -qscale 2 -vcodec msmpeg4 -acodec wmav2"

# No changes beyond this line!

mkdir $INPUT_FOLDER
echo "Place videos in Folder "$INPUT_FOLDER

rm -rf $OUTPUT_FOLDER
mkdir $OUTPUT_FOLDER
read -p "Press any key to continue... " -n1 -s

for f in $INPUT_FOLDER/$INPUT_MASK;
do
  FILENAME=$(echo ${f##*\/} | cut -d. -f1);
  ffmpeg  -i $f $OPTIONS $OUTPUT_FOLDER/$FILENAME.$FILETYPE;  
  echo $FILENAME;
done