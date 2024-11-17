# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io

# [ godot3 ]
extends KinematicBody2D

# : - constant
const c_speed: float = 6000.0

# : - variable
var v_momentum = Vector2.ZERO

func _process(_p_delta):
	# : - routine
	var _input = Input.get_vector("pad_left", "pad_right", "pad_up", "pad_down")
	self.v_momentum = _input * self.c_speed * _p_delta
	self.v_momentum = self.move_and_slide(self.v_momentum, Vector2.UP)

	# : - end
	pass
