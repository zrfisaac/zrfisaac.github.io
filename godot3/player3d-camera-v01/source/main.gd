# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io

# [ godot3 ]
extends Control

func _ready() -> void:
	# : - routine
	var _path: String = ""
	_path = "res://source/level/level-debug.tscn"
	if not(_path == ""):
		if (self.fn_exist(_path)):
			# warning-ignore:return_value_discarded
			#get_tree().change_scene_to_file(_path)
			get_tree().change_scene(_path)
	self.fn_main()

	# : - end
	pass

func fn_exist(_p_path: String) -> bool:
	var _file = File.new()
	if (_file.file_exists(_p_path)):
		return true
	return false

func fn_main() -> void:
	# : - routine

	# : - end
	pass
