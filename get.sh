#!/usr/bin/env bash

# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.bash.get : 26.10.11.1

# [ bash ]

# : - begin
printf '# - : %s\n' "$(realpath -- "$0")"

# : - begin
printf '# . - get\n'
if ! git clone "https://github.com/zrfisaac/zrfisaac.github.io.git" \
    "$HOME/zrfisaac" >/dev/null 2>&1; then
    printf '# . - error\n' >&2
    exit 1
fi

# : - end
printf '# . - end\n'
