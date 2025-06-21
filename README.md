# ExifTool Scripts
## IMPORTANT!
ALWAYS KEEP A BACKUP OF THE FILES YOU INTEND TO MODIFY.

## Foreword
The .sh script gets the date from the file name and inserts it into the file.  
It works for photos and videos that are renamed in one of the following ways:
- **IMG_yyyyMMdd_hhmmss**
- **IMG_yyyyMMdd_hhmmss_Etc**
- **IMG_yyyyMMdd_hhmmss_Etc Etc**
- **IMG_yyyyMMdd_hhmmss Etc**

For example, "IMG_20250620_184730", "IMG_20250620_184730_Vacation", or "IMG_20250620_184730_Vacation at the Sea".

## Preparation
1. Download and install Homebrew (https://brew.sh)
2. Install ExifTool from Terminal:  
  ```bash
brew install exiftool
```

### Creating the update_dates.sh file
1. Open Terminal
2. Choose the file path and navigate to that folder:  
    `cd [drag folder to terminal to display path]`
3. Create the file "update_dates.sh":  
    ```bash
    nano update_dates.sh
    ```
5. Insert the script.
6. Save the file:  
    Press `control+o`, then `Enter`, then `control+x`
7. Make the script executable:
    ```bash
    chmod +x update_dates.sh
    ```

## Running the script
Note that the .sh file has to be executable:
```bash
chmod +x update_dates.sh
```
1. Add the `.sh` file to the folder containing the files to be modified.
2. In Terminal, navigate to the target folder:  
    `cd [drag folder to terminal to display path]`  
4. Run the script:    
    ```bash
    ./update_dates.sh
    ```
   
**N.B.** This script doesn't support all types of files, so it's good practice to check the error messages in Terminal as files are being modified and, if necessary, use third-party applications (e.g. "A Better Finder Attributes") to modify them individually.

## Explanation of the script
`-overwrite_original`: It overwrites the original files (**ATTENTION!**).  
`-m`: It ignores minor warnings.  
`-r`: It applies changes to files in subdirectories as well.  
`-progress:-'ExifTool %p%% %20b'`: It displays a dynamic progress bar and percentage in the Terminal window title.
