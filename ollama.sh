#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.ollama : 0.0.3

# [ bash ]
user=""
[ "${user}" == "" ] && user=$(getent passwd 1000 | cut -d: -f1)
[ "${user}" == "" ] && user=$(getent passwd 15443 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""

# : - chat
if [ -x "$(which ollama)" ]
then
	# :   DeepSeek's first-generation of reasoning models with
	# : comparable performance to OpenAI-o1, including six dense models
	# : distilled from DeepSeek-R1 based on Llama and Qwen.
	ollama pull deepseek-r1:1.5b

	# :   Meta's Llama 3.2 goes small with 1B and 3B models.
	ollama pull llama3.2:1b

	# :   Qwen 1.5 is a series of large language models by Alibaba
	# : Cloud spanning from 0.5B to 110B parameters
	ollama pull qwen:0.5b

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
	ollama pull qwen2.5-coder:3b
	ollama pull qwen2.5-coder:7b

	# :   A family of small models with 135M, 360M, and 1.7B
	# : parameters, trained on a new high-quality dataset.
	ollama pull smollm:135m

	# :   SQLCoder is a code completion model fined-tuned on StarCoder
	# : for SQL generation tasks.
	ollama pull sqlcoder:7b
	ollama pull sqlcoder:15b

	# :   StarCoder is a code generation model trained on 80+
	# : programming languages.
	ollama pull starcoder:1b
fi

# : - embed
if [ -x "$(which ollama)" ]
then
	# :   State-of-the-art large embedding model from mixedbread.ai.
	ollama pull mxbai-embed-large:335m

	# :   A high-performing open embedding model with a large token
	# : context window.
	ollama pull nomic-embed-text:latest
fi
