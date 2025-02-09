#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.ollama : 0.0.1

# [ bash ]
user=""
[ "${user}" == "" ] && user=$(getent passwd 1000 | cut -d: -f1)
[ "${user}" == "" ] && user=$(getent passwd 15443 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
if [ -x "$(which ollama)" ]
then
	# :   The latest series of Code-Specific Qwen models, with
	# : significant improvements in code generation, code reasoning,
	# : and code fixing.
	ollama pull qwen2.5-coder:0.5b
	ollama pull qwen2.5-coder:1.5b

	# :   Qwen2.5 models are pretrained on Alibaba's latest large-scale
	# : dataset, encompassing up to 18 trillion tokens.
	# : The model supports up to 128K tokens and has multilingual
	# : support.
	ollama pull qwen2.5:0.5b
	ollama pull qwen2.5:1.5b
fi
