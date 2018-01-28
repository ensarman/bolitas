extends "res://personaje.gd"

func _ready():
	PLAYER_ORIGEN = global.ESTADO_PLAYER2

onready var sprite = get_node("Sprite")

func animate():
	if (Input.is_action_pressed("ui_jump")):
		if (sprite.get_frame() < 4 ):
			sprite.set_frame(sprite.get_frame()+1)
		else:
			sprite.set_frame(0)
	if (Input.is_action_pressed("move_left")):
		if (!sprite.is_flipped_h ()):
			sprite.set_flip_h (true)
	if (Input.is_action_pressed("move_right")):
		if (sprite.is_flipped_h ()):
			sprite.set_flip_h (false)
			
func apply_force(state):
	check_movement(global.PLAYER_2)
	animate()