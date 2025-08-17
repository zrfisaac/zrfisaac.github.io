# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# - email : zrfisaac@gmail.com
# - site : zrfisaac.github.io

# [ godot3 ]
extends Control

func _ready():
	# : - screen
	if OS.get_name() == "Windows":
		OS.set_window_position(
			(OS.get_screen_size() - OS.get_window_size()) / 2
		)

	# : - scene
	var _path = ""
	_path = "res://source/debug/debug_sprite.tscn"
	_path = "res://source/debug/debug_mesh.tscn"
	_path = "res://source/debug/debug_control.tscn"
	if File.new().file_exists(_path):
		get_tree().change_scene(_path)

	# : - end
	pass
