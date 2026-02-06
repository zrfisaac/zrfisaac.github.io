#!/usr/bin/python
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.python.ytdlp : 26.2.6.1

# [ python ]

# - libraries
import datetime
import os
import re
import subprocess

# : - function - fn_filename
def fn_filename():
    for _vi0 in range(1, 10000):  # Arbitrary limit for filenames
        _filename = f"{_vi0:04}.mp4"
        if not os.path.exists(f"{_vi0:04}.mp4") and not os.path.exists(f"{_vi0:04}.webm") :
            return _filename

# - variable
v_config_file = [
    "__.zrfi",
    "_.zrfi",
    "__about.zrfi",
    "__about.classified.zrfi",
    "__about.private.zrfi",
    "_about.zrfi",
    "_about.classified.zrfi",
    "_about.private.zrfi",
    "about.zrfi",
    "about.classified.zrfi",
    "about.private.zrfi"
]
v_end_error = False
v_end_message = ""

# - variable
v_pattern_group = r"# \[ (.*?) \]"
v_pattern_name = r"# - : ([^\s]+)"
v_pattern_value = r"# . - : ([^\s]+)"

# : - main
if not v_end_error:
    print("# [ main ]")
    try:
        # : - routine
        print("# - routine")
        for _config in v_config_file:
            if os.path.exists(_config):
                with open(_config, 'r') as _file:
                    _list = False
                    _name = ""
                    _value = ""
                    for _line in _file:
                        _line = _line.strip()
                        _section_match = re.match(v_pattern_group, _line)
                        if _section_match:
                            _section = _section_match.group(1).lower()
                        else:
                            _section_match = ""
                        if (_section == "video"):
                            if (_line.startswith("http")):
                                _value = _line
                            else:
                                _value = ""
                            if _value:
                                _name = fn_filename()
                                if os.path.exists("cookies.txt"):
                                    subprocess.run([
                                        "yt-dlp",
                                        "-f",
                                        "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best",
                                        "--cookies",
                                        "cookies.txt",
                                        "-o",
                                        _name,
                                        _value
                                    ])
                                else:
                                    subprocess.run([
                                        "yt-dlp",
                                        "-f",
                                        "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best",
                                        "-o",
                                        _name,
                                        _value
                                    ])
                        elif (_section == "list"):
                            _match = re.match(v_pattern_name, _line)
                            if _match:
                                _name = ""
                                _value = ""
                                if _match.group(1):
                                    _name = _match.group(1)
                            _match = re.match(v_pattern_value, _line)
                            if _match:
                                if _match.group(1):
                                    _value = _match.group(1)
                                    _extension = os.path.splitext(_name)[1]
                                    if not os.path.exists(_name):
                                        print("# . - :", _name)
                                        if (_extension == ".mp3"):
                                            if os.path.exists("cookies.txt"):
                                                subprocess.run([
                                                    "yt-dlp",
                                                    "-f",
                                                    "bestaudio",
                                                    "--extract-audio",
                                                    "--audio-format",
                                                    "mp3",
                                                    "--cookies",
                                                    "cookies.txt",
                                                    "-o",
                                                    _name,
                                                    _value
                                                ])
                                            else:
                                                subprocess.run([
                                                    "yt-dlp",
                                                    "-f",
                                                    "bestaudio",
                                                    "--extract-audio",
                                                    "--audio-format",
                                                    "mp3",
                                                    "-o",
                                                    _name,
                                                    _value
                                                ])
                                        else:
                                            if os.path.exists("cookies.txt"):
                                                subprocess.run([
                                                    "yt-dlp",
                                                    "-f",
                                                    "bv*[height<=760]+ba/b[height<=760]",
                                                    "--cookies",
                                                    "cookies.txt",
                                                    "-o",
                                                    _name,
                                                    _value
                                                ])
                                            else:
                                               subprocess.run([
                                                    "yt-dlp",
                                                    "-f",
                                                    "bv*[height<=760]+ba/b[height<=760]",
                                                   "-o",
                                                    _name,
                                                    _value
                                                ])
    except Exception as _exception:
        v_end_error = True
        v_end_message = str(_exception)
    print("")

# : - end
print("# [ end ]")
if v_end_error:
    print("# - error")
else:
    print("# - success")
if v_end_message != "":
    print("# . - message : " + v_end_message)
#input("")
