#!/usr/bin/python
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io

# [ python ]

# - libraries
import os
import shutil


# : - variable
v_source = "./binary"
v_target = "./_"

# : - main

# : Remove the target directory if it exists, then recreate it
if os.path.exists(v_target):
    shutil.rmtree(v_target)
os.makedirs(v_target)

# : Iterate through each folder in the source root directory
for folder_name in os.listdir(v_source):
    folder_path = os.path.join(v_source, folder_name)
    # : Ensure it is a directory
    if os.path.isdir(folder_path):
        exe_file_path = os.path.join(folder_path, "zrfisaac.exe")
        # : Check if the executable file exists in the folder
        if os.path.isfile(exe_file_path):
            # : Define the target file path with the new name based on the folder
            target_file_path = os.path.join(v_target, f"{os.path.basename(os.getcwd())}-{folder_name}.exe")
            # : Copy and rename the .exe file
            shutil.copy2(exe_file_path, target_file_path)
            print(f"Copied and renamed {exe_file_path} to {target_file_path}")
