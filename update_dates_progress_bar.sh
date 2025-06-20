#!/bin/bash

PHOTO_EXTS="jpg jpeg heic png"
VIDEO_EXTS="mp4 mov"

# === Function to process files with exiftool and progress ===
process_files() {
  local files=("$@")
  local total=${#files[@]}
  local count=0

  for file in "${files[@]}"; do
    # Run exiftool command passed as EXIF_CMD
    eval exiftool "$EXIF_CMD" -overwrite_original \""$file"\" > /dev/null
    count=$((count + 1))
    printf "\rProgress: %d/%d (%.1f%%)" "$count" "$total" "$(echo "$count * 100 / $total" | bc -l)"
  done
  echo
}

# === PHOTOS: Update EXIF dates ===
echo "Updating EXIF dates for PHOTOS..."
mapfile -t PHOTOS < <(find . -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.heic" -o -iname "*.png" \))

EXIF_CMD="'-alldates<\${filename;s/.*?(\d{8})_(\d{6}).*/\$1 \$2/}'"
process_files "${PHOTOS[@]}"

# === VIDEOS: Update QuickTime dates ===
echo "Updating QuickTime dates for VIDEOS..."
mapfile -t VIDEOS < <(find . -type f \( -iname "*.mp4" -o -iname "*.mov" \))

for file in "${VIDEOS[@]}"; do
  exiftool \
    '-QuickTime:CreateDate<${filename;s/.*?(\d{8})_(\d{6}).*/$1 $2/}' \
    '-QuickTime:ModifyDate<${filename;s/.*?(\d{8})_(\d{6}).*/$1 $2/}' \
    -overwrite_original "$file" > /dev/null
  count=$((count + 1))
  printf "\rProgress: %d/%d (%.1f%%)" "$count" "${#VIDEOS[@]}" "$(echo "$count * 100 / ${#VIDEOS[@]}" | bc -l)"
done
echo

# === PHOTOS: Update FILESYSTEM dates ===
echo "Updating FILESYSTEM dates from DateTimeOriginal for PHOTOS..."
EXIF_CMD="'-FileCreateDate<DateTimeOriginal' '-FileModifyDate<DateTimeOriginal'"
process_files "${PHOTOS[@]}"

# === VIDEOS: Update FILESYSTEM dates ===
echo "Updating FILESYSTEM dates from CreateDate for VIDEOS..."
count=0
for file in "${VIDEOS[@]}"; do
  exiftool \
    '-FileCreateDate<CreateDate' \
    '-FileModifyDate<CreateDate' \
    -overwrite_original "$file" > /dev/null
  count=$((count + 1))
  printf "\rProgress: %d/%d (%.1f%%)" "$count" "${#VIDEOS[@]}" "$(echo "$count * 100 / ${#VIDEOS[@]}" | bc -l)"
done
echo

echo "Done!"
