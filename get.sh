#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# version : zrfisaac.get : 26.3.6.1

# [ bash ]
if [ ! -d ".github" ]
then
	git clone https://github.com/zrfisaac/zrfisaac.github.io.git _
	mv _/* .
	mv _/.* .
	rm -rvf
fi
