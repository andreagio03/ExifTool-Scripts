# ExifTool's Commands
First, in Terminal, navigate to the directory of the file you want to edit, using `cd`, as shown in the README file.

## Checking a file's metadata
```Bash
exiftool -time:all -a -G1 nome_file.estensione
```

## Copy video date to file creation date
- .MOV:  
```Bash
exiftool '-FileCreateDate<QuickTime:CreateDate' '-FileModifyDate<QuickTime:CreateDate' -overwrite_original *.MOV
```
- .mov:  
```Bash
exiftool '-FileCreateDate<QuickTime:CreateDate' '-FileModifyDate<QuickTime:CreateDate' -overwrite_original *.mov
```
- .mp4:  
```Bash
exiftool '-FileCreateDate<QuickTime:CreateDate' '-FileModifyDate<QuickTime:CreateDate' -overwrite_original *.mp4
```

## Copy photo date to file creation date
- .JPG:  
```Bash
exiftool '-FileCreateDate<DateTimeOriginal' '-FileModifyDate<DateTimeOriginal' -overwrite_original *.JPG
```
- .jpg:  
```Bash
exiftool '-FileCreateDate<DateTimeOriginal' '-FileModifyDate<DateTimeOriginal' -overwrite_original *.jpg
```
- .jpeg:  
```Bash
exiftool '-FileCreateDate<DateTimeOriginal' '-FileModifyDate<DateTimeOriginal' -overwrite_original *.jpeg
```
- .HEIC:  
```Bash
exiftool '-FileCreateDate<DateTimeOriginal' '-FileModifyDate<DateTimeOriginal' -overwrite_original *.HEIC
```
- .heic:  
```Bash
exiftool '-FileCreateDate<DateTimeOriginal' '-FileModifyDate<DateTimeOriginal' -overwrite_original *.heic
```
- .PNG:  
```Bash
exiftool '-FileCreateDate<DateTimeOriginal' '-FileModifyDate<DateTimeOriginal' -overwrite_original *.PNG
```
- .png:  
```Bash
exiftool '-FileCreateDate<DateTimeOriginal' '-FileModifyDate<DateTimeOriginal' -overwrite_original *.png
```
