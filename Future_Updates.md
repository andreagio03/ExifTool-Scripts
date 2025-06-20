# Add a progress bar  
https://exiftool.org/forum/index.php?topic=11975.0  
  `-progress[NUM][:[TITLE]]`  
Show the progress when processing files. Without a colon, the -progress option adds a progress count in brackets after the name of each processed file, giving the current file number and the total number of files to be processed. Implies the -v0 option, causing the names of processed files to also be printed when writing. When combined with the -if option, the total count includes all files before the condition is applied, but files that fail the condition will not have their names printed. If NUM is specified, the progress is shown every NUM input files.

If followed by a colon (ie. -progress:), the console window title is set according to the specified TITLE string. If no TITLE is given, a default TITLE string of "ExifTool %p%%" is assumed. In the string, %f represents the file name, %p is the progress as a percent, %r is the progress as a ratio, %##b is a progress bar of width "##" (where "##" is an integer specifying the bar width in characters, or 20 characters by default if "##" is omitted), and %% is a % character. May be combined with the normal -progress option to also show the progress count in console messages. (Note: For this feature to function correctly on Mac/Linux, stderr must go to the console.)

 # Speed up the process – currently, files are processed one by one.
