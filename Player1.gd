extends "res://personaje.gd"

func _ready():
	acceleration = 1000
	top_move_speed = 200
	top_jump_speed = 300

var f = 0;
func apply_force(state):
	if (Input.is_action_pressed("move_left")):
		directional_force += DIRECTION.LEFT
	if (Input.is_action_pressed("move_right")):
		directional_force += DIRECTION.RIGHT
	if (Input.is_action_pressed("move_jump")):
		directional_force += DIRECTION.UP


func _on_Bolita_body_enter( body ):
	f+=1
	var x2= f%3

	get_node("Sprite").set_frame(x2);
	update()
	_change_notify()
	get_node("Sprite").update()
	get_node("Sprite")._change_notify()
	print("asdsada")
	pass # replace with function body
