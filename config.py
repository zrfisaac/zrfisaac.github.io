#!/usr/bin/python
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# version : zrfisaac.config : 1.0.0

# [ python ]

# - libraries
import subprocess

# : - main
subprocess.run(["git", "config", "--global", "user.name", "Isaac Caires"])
subprocess.run(["git", "config", "--global", "user.email", "zrfisaac@gmail.com"])
