#!/bin/bash

echo "Updating EXIF dates for PHOTOS (jpg, jpeg, heic, png)..."
exiftool -r '-alldates<${filename;s/.*?(\d{8})_(\d{6}).*/$1 $2/}' \
  -ext jpg -ext jpeg -ext heic -ext png -overwrite_original .

echo "Updating QuickTime dates for VIDEOS (mp4, mov)..."
exiftool -r \
  '-QuickTime:CreateDate<${filename;s/.*?(\d{8})_(\d{6}).*/$1 $2/}' \
  '-QuickTime:ModifyDate<${filename;s/.*?(\d{8})_(\d{6}).*/$1 $2/}' \
  -ext mp4 -ext mov -overwrite_original .

echo "Updating FILESYSTEM dates from DateTimeOriginal for PHOTOS..."
exiftool -r \
  '-FileCreateDate<DateTimeOriginal' \
  '-FileModifyDate<DateTimeOriginal' \
  -ext jpg -ext jpeg -ext heic -ext png -overwrite_original .

echo "Updating FILESYSTEM dates from CreateDate for VIDEOS..."
exiftool -r \
  '-FileCreateDate<CreateDate' \
  '-FileModifyDate<CreateDate' \
  -ext mp4 -ext mov -overwrite_original .

echo "Done!"
