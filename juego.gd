extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var player_pos
const MOVE_SPEED = 120
enum {MOVE_RIGHT, MOVE_LEFT}


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	player_pos = get_node("player").get_pos()
	set_process(true)

func move_player(direction, delta):
	if direction == MOVE_LEFT:
		player_pos.x += - MOVE_SPEED * delta
	elif direction == MOVE_RIGHT:
		player_pos.x += MOVE_SPEED * delta
	
	get_node("player").set_pos(player_pos)

func _process(delta):
	if(Input.is_action_pressed("player_left")):
		move_player(MOVE_LEFT, delta)
	if(Input.is_action_pressed("player_right")):
		move_player(MOVE_RIGHT, delta)
	