#!/usr/bin/python
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# version : zrfisaac.python.file.name.v01 : 1.0.0

# [ python ]

# - libraries
import os

# : - main
print("# [ main ]")
print("# - path : ", os.path.abspath(__file__))
print("# - file : ", os.path.basename(__file__))
print("# - name : ", os.path.splitext(os.path.basename(__file__))[0])
print("# - extension : ", os.path.splitext(os.path.basename(__file__))[-1])
print("")

# : - end
print("# [ end ]")
input("")
