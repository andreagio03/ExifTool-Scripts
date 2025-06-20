# ExifTool-Scritps
## Foreword
All my files photos and videos are renamed in one of the following ways:
- **IMG_yyyyMMdd_hhmmss**
- **IMG_yyyyMMdd_hhmmss_Etc**
- **IMG_yyyyMMdd_hhmmss_Etc Etc**

For example, "IMG_20250620_184730", "IMG_20250620_184730_Vacation", or "IMG_20250620_184730_Vacation at the Sea".

## Preparation
1. Download and install Homebrew (https://brew.sh)
2. Install ExifTool from Terminal:  
  `brew install exiftool`

### How to create a .sh file
1. Open Terminal
2. Choose the file path and navigate to that folder:  
    `cd [drag folder to terminal to display path]`
3. Create the file "update_dates.sh":  
    `nano update_dates.sh`
4. Insert the script.
5. Save the file:  
    Press `control+o`, then `Enter`, then `control+x`
7. Make the script exectuable:
    `chmod +x update_dates.sh`

## How to run the scritp
1. Add the `.sh` file to the folder containing the files to be modified.
2. In Terminal, navigate to the target folder:  
    `cd [drag folder to terminal to display path]`  
4. Run the script:  
    `./update_dates.sh 2>&1 | grep -v "Warning"`  
Alternatively, if you want to display all warning messages:  
    `./update_dates.sh`
   
**N.B.** Not all file types are supported, so it's good practice to check the error messages in Terminal as files are being modified and, if necessary, use third-party applications (e.g. "A Better Finder Attributes") to modify them individually.
