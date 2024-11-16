# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io

# [ godot3 ]
extends Camera

# Rotation settings
export var rotation_speed := 50.0  # Speed of rotation
export var pitch_limit := 35.0  # Maximum up/down angle (degrees)
export var yaw_limit := 35.0  # Maximum Left/right angle (degrees)

# Current rotation values
var yaw := 0.0  # Left/right rotation
var pitch := 0.0  # Up/down rotation

var last_touch_position: Vector2 = Vector2.ZERO
var dragging: bool = false
var screen_drag_speed := 0.2  # Speed for touch drag-based rotation

func _input(event):
	# Handle touch drag input
	if event is InputEventScreenTouch:
		if event.pressed:  # If the touch is pressed
			last_touch_position = event.position  # Store the initial touch position
			dragging = true
		else:
			dragging = false  # Stop dragging when touch is released
	if event is InputEventScreenDrag and dragging:
		# Calculate the difference in touch position
		var delta_touch = event.position - last_touch_position
		yaw -= delta_touch.x * screen_drag_speed
		pitch -= delta_touch.y * screen_drag_speed
		pitch = clamp(pitch, -pitch_limit, pitch_limit)

		# Update the last touch position
		last_touch_position = event.position

func _process(delta):
	# Get input from the directional pad
	var input_up = Input.is_action_pressed("pad_down")
	var input_down = Input.is_action_pressed("pad_up")
	var input_left = Input.is_action_pressed("pad_right")
	var input_right = Input.is_action_pressed("pad_left")
	var _input = Vector2.ONE
	_input = Input.get_vector("pad_left", "pad_right", "pad_up", "pad_down")
	
	# Adjust pitch (up/down) and apply limits
	if input_up:
		pitch -= (rotation_speed * _input.y) * delta
	if input_down:
		pitch += (rotation_speed * _input.y) * delta
	pitch = clamp(pitch, -pitch_limit, pitch_limit)
	
	# Adjust yaw (left/right)
	if input_left:
		yaw -= (rotation_speed * _input.x) * delta
	if input_right:
		yaw += (rotation_speed * _input.x) * delta
	yaw = clamp(yaw, -yaw_limit, yaw_limit)
	
	# Apply the rotations
	rotation_degrees = Vector3(pitch, yaw, 0)
