# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.python.clone : 26.10.2.1

# [ python ]

import argparse
import json
from pathlib import Path
import re
import subprocess
import sys


# : - config
def _json(_text):
	# : - config - comments - // / /* */
	_text = re.sub(
		r'"(?:\\.|[^"\\])*"|//[^\r\n]*|/\*[\s\S]*?\*/',
		lambda _: _.group() if _.group().startswith('"') else re.sub(r"[^\r\n]", " ", _.group()),
		_text,
	)
	return json.loads(_text)


def _config(_path):
	c_clone = []
	for _name in ("config.json", "_config.json", "_.json"):
		_file = _path / _name
		if not _file.is_file():
			continue
		with _file.open(encoding="utf-8-sig") as _:
			_data = _json(_.read())
		if not isinstance(_data, dict):
			raise ValueError(f"{_file} : config deve ser um objeto")
		if "c_clone" not in _data:
			continue
		if not isinstance(_data["c_clone"], list):
			raise ValueError(f"{_file} : c_clone deve ser uma lista")
		c_clone = []
		for _clone in _data["c_clone"]:
			if (not isinstance(_clone, list) or len(_clone) != 2
				or not all(isinstance(_, str) and _.strip() for _ in _clone)):
				raise ValueError(f"{_file} : cada clone deve conter [url, pasta]")
			_clone = (_clone[0], _path / _clone[1].replace("\\", "/"))
			c_clone.append(_clone)
	return c_clone


# : - clone
def _clone(c_clone, _name, _dry_run):
	print(f"# . - clone - {_name}", flush=True)
	_error = 0
	for _url, _path in c_clone:
		print(f"# . - clone - {_name} : {_url} {_path}", flush=True)
		if _dry_run:
			continue
		_result = subprocess.run(
			["git", "clone", _url, str(_path)],
			stdout=subprocess.PIPE, stderr=subprocess.PIPE,
			encoding="utf-8", errors="replace",
		)
		if _result.returncode:
			print(f"# . - error : {_result.stderr.strip()}", file=sys.stderr)
			_error = 1
	return _error


def _main():
	_args = argparse.ArgumentParser(description="# . - clone - public / private")
	_args.add_argument("--dry-run", action="store_true", help="mostrar sem clonar")
	_args.add_argument("--no-pause", action="store_true", help="terminar sem aguardar Enter")
	_args = _args.parse_args()
	_path = Path(__file__).resolve().parent
	_error = 0

	# : - begin
	print(f"# - : {Path(__file__).resolve()}", flush=True)
	try:
		# : - clone - public
		c_clone = _config(_path)
		_error |= _clone(c_clone, "public", _args.dry_run)

		# : - config - private
		_private = _path / "private"
		if any((_private / _).is_file() for _ in ("config.json", "_config.json", "_.json")):
			c_clone = _config(_private)

			# : - clone - private
			_error |= _clone(c_clone, "private", _args.dry_run)
		elif (_private / "config.bat").is_file():
			print("# . - error : converta private/config.bat para private/config.json", file=sys.stderr)
			_error = 1
	except (OSError, ValueError) as _:
		print(f"# . - error : {_}", file=sys.stderr)
		_error = 1

	# : - end
	print("# . - end", flush=True)
	if not _args.no_pause and sys.stdin.isatty():
		try:
			_ = input()
		except EOFError:
			pass
	return _error


if __name__ == "__main__":
	sys.exit(_main())
