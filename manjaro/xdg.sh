#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.xdg : 26.2.22.1

# [ bash ]
user=$(getent passwd 1000 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} pacman -S --noconfirm xdg-user-dirs

rm -rvf $HOME/Desktop
rm -rvf $HOME/Downloads
rm -rvf $HOME/Templates
rm -rvf $HOME/Public
rm -rvf $HOME/Documents
rm -rvf $HOME/Music
rm -rvf $HOME/Pictures
rm -rvf $HOME/Videos

mkdir -p $HOME/desktop
mkdir -p $HOME/download
mkdir -p $HOME/template
mkdir -p $HOME/public
mkdir -p $HOME/document
mkdir -p $HOME/music
mkdir -p $HOME/picture
mkdir -p $HOME/video

echo 'XDG_DESKTOP_DIR="$HOME/desktop"' > /zrfisaac/.config/user-dirs.dirs
echo 'XDG_DOWNLOAD_DIR="$HOME/download"' >> /zrfisaac/.config/user-dirs.dirs
echo 'XDG_TEMPLATES_DIR="$HOME/templates"' >> /zrfisaac/.config/user-dirs.dirs
echo 'XDG_PUBLICSHARE_DIR="$HOME/public"' >> /zrfisaac/.config/user-dirs.dirs
echo 'XDG_DOCUMENTS_DIR="$HOME/document"' >> /zrfisaac/.config/user-dirs.dirs
echo 'XDG_MUSIC_DIR="$HOME/music"' >> /zrfisaac/.config/user-dirs.dirs
echo 'XDG_PICTURES_DIR="$HOME/picture"' >> /zrfisaac/.config/user-dirs.dirs
echo 'XDG_VIDEOS_DIR="$HOME/video"' >> /zrfisaac/.config/user-dirs.dirs
