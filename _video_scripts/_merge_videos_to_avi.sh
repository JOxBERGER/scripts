#!/bin/bash
INPUT_FOLDER="./out/*.*"
OUTPUT_FOLDER="./outmerged"
FILETYPE="avi"
OPTIONS="-vcodec libx264 -vf scale="800:480" -b:v 600k -r 30"

# no changes beyond this line ###############################################
rm -rf video_input_list.txt

#generate List of Videos in Folder
for f in $INPUT_FOLDER; do echo "file '$f'" >> ./video_input_list.txt; done

mkdir $OUTPUT_FOLDER
# read filelist and stream to output.avi
ffmpeg -f concat -i video_input_list.txt -c copy $OPTIONS $OUTPUT_FOLDER/output_merged.$FILETYPE

rm -rf video_input_list.txt