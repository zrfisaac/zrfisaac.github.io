#!/usr/bin/python
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.python.unzip : 1.0.0

# [ python ]
import os
import subprocess

def extract_all_zip_files(directory):
    """
    Extracts all .zip files in the given directory using 7z.
    """
    # Check if the directory exists
    if not os.path.exists(directory):
        print(f"Directory {directory} does not exist.")
        return

    # List all files in the directory
    files = os.listdir(directory)
    
    for file in files:
        if file.endswith('.zip'):  # Check for .zip files
            file_path = os.path.join(directory, file)
            print(f"Extracting: {file_path}")
            try:
                # Run the `7z x` command
                subprocess.run(["7z", "x", file_path, "-o" + directory], check=True)
                print(f"Successfully extracted: {file}")
            except subprocess.CalledProcessError as e:
                print(f"Error extracting {file}: {e}")
            except FileNotFoundError:
                print("7z is not installed or not found in PATH.")
                break

if __name__ == "__main__":
    # Replace this with the directory containing your .zip files
    directory_to_extract = "."
    extract_all_zip_files(directory_to_extract)
