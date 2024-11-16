# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io

# [ url ]

# - : https://kidscancode.org/godot_recipes/4.x/2d/multi_target_camera/index.html

# [ godot3 ]
extends Camera2D

# : - constant
const c_speed: float = 6.0
const c_zoom_speed = 3.0
const c_zoom_min = 5.0
const c_zoom_max = 0.5

# : - parameter
export(NodePath) var p_player
export(NodePath) var p_target

# : - variable
var v_player: Node = null
var v_target: Node = null
var v_margin: Vector2 = Vector2(512, 512)

# : - value
onready var v_screen = get_viewport_rect().size

func _ready():
	# : - routine
	if (
		(self.p_player != null)
		and
		(has_node(self.p_player))
	):
		self.v_player = get_node(self.p_player)
	if (
		(self.p_target != null)
		and
		(has_node(self.p_target))
	):
		self.v_target = get_node(self.p_target)

	# : - end
	pass

func _process(_p_delta):
	# : - routine
	if (
		(self.v_player)
		and
		(self.v_target)
	):
		# : - position
		var _position = Vector2.ZERO
		_position += self.v_player.global_position
		_position += self.v_target.global_position
		_position /= 2
		self.position = lerp(self.position, _position, self.c_speed * _p_delta)

		# : - size
		var _rect = Rect2(self.position, Vector2.ONE)
		_rect = _rect.expand(self.v_target.position)
		_rect = _rect.expand(self.v_player.position)
		_rect = _rect.grow_individual(self.v_margin.x, self.v_margin.y, self.v_margin.x, self.v_margin.y)
		print(_rect)
		var _zoom
		if _rect.size.x > _rect.size.y * self.v_screen.aspect():
			_zoom = 1 / clamp(_rect.size.x / self.v_screen.x, self.c_zoom_min, self.c_zoom_max)
		else:
			_zoom = 1 / clamp(_rect.size.y / self.v_screen.y, self.c_zoom_min, self.c_zoom_max)
		#self.zoom = lerp(self.zoom, Vector2.ONE * _zoom, self.c_zoom_speed)
		#self.zoom = Vector2(2,2)
		#print(lerp(self.zoom, Vector2.ONE * _zoom, self.c_zoom_speed))
	elif (self.v_player):
		# : - position
		self.position = lerp(self.position, self.v_player.global_position, self.c_speed * _p_delta)

	# : - end
	pass
