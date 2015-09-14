#!/bin/bash
# define the input folder and filemask
INPUT_FOLDER="./in"
INPUT_MASK="*.*"
OUTPUT_FOLDER="./out"
IMAGENAME="nfc_connect_"
FILETYPE="jpg"
OPTIONS="-r 30 -f image2 "

# No changes beyond this line!

NUMBER="%3d"

mkdir $INPUT_FOLDER
echo "Place videos in Folder "$INPUT_FOLDER

rm -rf $OUTPUT_FOLDER
mkdir $OUTPUT_FOLDER
read -p "Press any key to continue... " -n1 -s

for f in $INPUT_FOLDER/$INPUT_MASK;
do
  FILENAME=$(echo ${f##*\/} | cut -d. -f1);
  ffmpeg  -i $f $OPTIONS $OUTPUT_FOLDER/$IMAGENAME$NUMBER.$FILETYPE;  
  echo $FILENAME;
done
