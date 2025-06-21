#!/bin/bash

echo "Updating EXIF dates for PHOTOS..."
exiftool -m -r -progress:-'ExifTool %p%% %20b' '-alldates<${filename;s/.*?(\d{8})_(\d{6}).*/$1 $2/}' \
  -ext JPG -ext jpg -ext jpeg -ext HEIC -ext heic -ext PNG -ext png -overwrite_original .

echo "Updating QuickTime dates for VIDEOS..."
exiftool -m -r -progress:-'ExifTool %p%% %20b' \
  '-QuickTime:CreateDate<${filename;s/.*?(\d{8})_(\d{6}).*/$1 $2/}' \
  '-QuickTime:ModifyDate<${filename;s/.*?(\d{8})_(\d{6}).*/$1 $2/}' \
  -ext MP4 -ext mp4 -ext MOV -ext mov -overwrite_original .

echo "Updating FILESYSTEM dates from DateTimeOriginal for PHOTOS..."
exiftool -m -r -progress:-'ExifTool %p%% %20b' \
  '-FileCreateDate<DateTimeOriginal' \
  '-FileModifyDate<DateTimeOriginal' \
  -ext JPG -ext jpg -ext jpeg -ext HEIC -ext heic -ext PNG -ext png -overwrite_original .

echo "Updating FILESYSTEM dates from CreateDate for VIDEOS..."
exiftool -m -r -progress:-'ExifTool %p%% %20b' \
  '-FileCreateDate<CreateDate' \
  '-FileModifyDate<CreateDate' \
  -ext MP4 -ext mp4 -ext MOV -ext mov -overwrite_original .

echo "Done!"
