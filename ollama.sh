#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.ollama : 0.0.2

# [ bash ]
user=""
[ "${user}" == "" ] && user=$(getent passwd 1000 | cut -d: -f1)
[ "${user}" == "" ] && user=$(getent passwd 15443 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
if [ -x "$(which ollama)" ]
then
	# :   DeepSeek's first-generation of reasoning models with
	# : comparable performance to OpenAI-o1, including six dense models
	# : distilled from DeepSeek-R1 based on Llama and Qwen.
	ollama pull deepseek-r1:1.5b

	# :   Meta's Llama 3.2 goes small with 1B and 3B models.
	ollama pull llama3.2:1b

	# :   Qwen2.5 models are pretrained on Alibaba's latest large-scale
	# : dataset, encompassing up to 18 trillion tokens.
	# : The model supports up to 128K tokens and has multilingual
	# : support.
	ollama pull qwen2.5:0.5b
	ollama pull qwen2.5:1.5b

	# :   The latest series of Code-Specific Qwen models, with
	# : significant improvements in code generation, code reasoning,
	# : and code fixing.
	ollama pull qwen2.5-coder:0.5b
	ollama pull qwen2.5-coder:1.5b
fi
