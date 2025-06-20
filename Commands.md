# ExifTool's Commands
First, in Terminal, navigate to the directory of the file you want to edit, using `cd`, as shown in the README file.

## Checking a file's metadata
`exiftool -time:all -a -G1 nome_file.estensione`

## Copy video date to file creation date
- .MOV:  
`exiftool '-FileCreateDate<QuickTime:CreateDate' '-FileModifyDate<QuickTime:CreateDate' -overwrite_original *.MOV`
- .mov:  
`exiftool -FileCreateDate<QuickTime:CreateDate' '-FileModifyDate<QuickTime:CreateDate' -overwrite_original *.mov`
- .mp4:  
`exiftool '-FileCreateDate<QuickTime:CreateDate' '-FileModifyDate<QuickTime:CreateDate' -overwrite_original *.mp4`

## Copy photo date to file creation date
- .JPG:  
`exiftool '-FileCreateDate<DateTimeOriginal' '-FileModifyDate<DateTimeOriginal' -overwrite_original *.JPG`
- .jpg:  
`exiftool '-FileCreateDate<DateTimeOriginal' '-FileModifyDate<DateTimeOriginal' -overwrite_original *.jpg`
- .jpeg:  
`exiftool '-FileCreateDate<DateTimeOriginal' '-FileModifyDate<DateTimeOriginal' -overwrite_original *.jpeg`
- .HEIC:  
`exiftool '-FileCreateDate<DateTimeOriginal' '-FileModifyDate<DateTimeOriginal' -overwrite_original *.HEIC`
- .heic:  
`exiftool '-FileCreateDate<DateTimeOriginal' '-FileModifyDate<DateTimeOriginal' -overwrite_original *.heic`
- .PNG:  
`exiftool '-FileCreateDate<DateTimeOriginal' '-FileModifyDate<DateTimeOriginal' -overwrite_original *.PNG`
- .png:  
`exiftool '-FileCreateDate<DateTimeOriginal' '-FileModifyDate<DateTimeOriginal' -overwrite_original *.png`
