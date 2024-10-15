#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# version : zrfisaac.bash.base.v01 : 1.0.0

# [ bash ]

# - variable
v_end_error=false
v_end_message=""

# : - about
echo "# [ about ]"
echo "# - author : Isaac Caires"
echo "# . - email : zrfisaac@gmail.com"
echo "# . - site : zrfisaac.github.io"
echo "# - version : zrfisaac.bash.base.v01 : 1.0.0"
echo ""

# : - main
if [ "$v_end_error" = false ]; then
    echo "# [ main ]"
    {
        # : - routine
        echo "# - routine"
    } || {
        v_end_error=true
        v_end_message="An error occurred during the routine."
    }
    echo ""
fi

# : - end
echo "# [ end ]"
if [ "$v_end_error" = true ]; then
    echo "# - error"
else
    echo "# - success"
fi
if [ -n "$v_end_message" ]; then
    echo "# . - message : $v_end_message"
fi
read -p ""
