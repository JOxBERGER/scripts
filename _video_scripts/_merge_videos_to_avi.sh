#!/bin/bash
INPUT_FOLDER="./in"
INPUT_MASK="*.*"
OUTPUT_FOLDER="./outmerged"
FILETYPE="avi"
OPTIONS="-vcodec libx264 -vf scale="800:480" -b:v 600k -r 30"

# convert to wmv change file type as well!
#-r 30 -qscale 2 -vcodec msmpeg4 -acodec wmav2 
##################################################

mkdir $INPUT_FOLDER
echo "Place videos in Folder "$INPUT_FOLDER

rm -rf $OUTPUT_FOLDER
mkdir $OUTPUT_FOLDER
read -p "Press any key to continue... " -n1 -s

# no changes beyond this line ###############################################
rm -rf video_input_list.txt

#generate List of Videos in Folder
for f in $INPUT_FOLDER/$INPUT_MASK; do echo "file '$f'" >> ./video_input_list.txt; done

mkdir $OUTPUT_FOLDER
# read filelist and stream to output.avi
ffmpeg -f concat -i video_input_list.txt -c copy $OPTIONS $OUTPUT_FOLDER/output_merged.$FILETYPE

rm -rf video_input_list.txt