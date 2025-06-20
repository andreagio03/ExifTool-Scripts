#!/bin/bash

# --- PHOTOS ---

# Count the number of photo files for the progress bar
# We use find to search up to 10 directories deep for the specified file types.
# The `wc -l` command counts the lines to get a total number of files.
photo_count=$(find . -maxdepth 10 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.heic" -o -iname "*.png" \) | wc -l)

# Only run the commands if photo files were actually found.
if [ "$photo_count" -gt 0 ]; then
  echo "Updating EXIF dates for $photo_count PHOTOS (jpg, jpeg, heic, png)..."
  # 1. `find`: Finds files and separates them with a null character (-print0) to handle spaces/special characters.
  # 2. `pv`: Creates the progress bar.
  #    -l tells pv to count by lines (one file per line).
  #    -s sets the total size of the bar to our file count.
  # 3. `xargs -0`: Executes the exiftool command, reading the null-separated file list.
  find . -maxdepth 10 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.heic" -o -iname "*.png" \) -print0 | \
    pv -l -s "$photo_count" | \
    xargs -0 exiftool -r '-alldates<${filename;s/.*?(\d{8})_(\d{6}).*/$1 $2/}' -overwrite_original

  echo "Updating FILESYSTEM dates from DateTimeOriginal for $photo_count PHOTOS..."
  find . -maxdepth 10 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.heic" -o -iname "*.png" \) -print0 | \
    pv -l -s "$photo_count" | \
    xargs -0 exiftool -r '-FileCreateDate<DateTimeOriginal' '-FileModifyDate<DateTimeOriginal' -overwrite_original
else
  echo "No photo files found to process."
fi


# --- VIDEOS ---

# Count the number of video files for the progress bar
video_count=$(find . -maxdepth 10 -type f \( -iname "*.mp4" -o -iname "*.mov" \) | wc -l)

if [ "$video_count" -gt 0 ]; then
  echo "Updating QuickTime dates for $video_count VIDEOS (mp4, mov)..."
  find . -maxdepth 10 -type f \( -iname "*.mp4" -o -iname "*.mov" \) -print0 | \
    pv -l -s "$video_count" | \
    xargs -0 exiftool -r '-QuickTime:CreateDate<${filename;s/.*?(\d{8})_(\d{6}).*/$1 $2/}' '-QuickTime:ModifyDate<${filename;s/.*?(\d{8})_(\d{6}).*/$1 $2/}' -overwrite_original

  echo "Updating FILESYSTEM dates from CreateDate for $video_count VIDEOS..."
  find . -maxdepth 10 -type f \( -iname "*.mp4" -o -iname "*.mov" \) -print0 | \
    pv -l -s "$video_count" | \
    xargs -0 exiftool -r '-FileCreateDate<CreateDate' '-FileModifyDate<CreateDate' -overwrite_original
else
  echo "No video files found to process."
fi

echo "Done!"
