#!/usr/bin/python
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# version : zrfisaac.python.path : 1.0.1

# [ python ]

# - libraries
import os

# : - main
print("# [ main ]")
print("# - extension :", os.path.splitext(os.path.basename(__file__))[-1])
print("# - file :", os.path.basename(__file__))
print("# - folder :", os.path.basename(os.getcwd()))
print("# - name :", os.path.splitext(os.path.basename(__file__))[0])
print("# - path :", os.path.abspath(__file__))
print("")

# : - end
print("# [ end ]")
input("")
