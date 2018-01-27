extends "res://personaje.gd"

func _ready():
	acceleration = 1000
	top_move_speed = 200
	top_jump_speed = 300


func apply_force(state):
	if (Input.is_action_pressed("ui_left")):
		directional_force += DIRECTION.LEFT
	if (Input.is_action_pressed("ui_right")):
		directional_force += DIRECTION.RIGHT
	if (Input.is_action_pressed("ui_jump")):
		directional_force += DIRECTION.UP
