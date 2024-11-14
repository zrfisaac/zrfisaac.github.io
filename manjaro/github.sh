#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.debian.github : 1.0.0

# [ shell ]

# - : gh auth login

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} pacman -Sy --noconfirm curl gnupg
${sudo} curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | ${sudo} tee /usr/share/keyrings/githubcli-archive-keyring.gpg > /dev/null
${sudo} pacman -Sy --noconfirm gh
wget -O _.deb https://github.com/shiftkey/desktop/releases/download/release-3.4.3-linux1/GitHubDesktop-linux-amd64-3.4.3-linux1.deb
${sudo} pacman -Sy --noconfirm debtap
${sudo} debtap _.deb
${sudo} pacman -U _.zst
[ -f "_.deb" ] && rm _.deb
