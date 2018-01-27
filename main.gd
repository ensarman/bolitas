extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var img
const SPEED=100
var scale
var rotate=0

func _ready():
	img=get_node("img")
	set_process(true)
	scale=Vector2(1,1)
	
	# Called every time the node is added to the scene.
	# Initialization here

func _process(delta):
	var motion=Vector2()
	
	if(Input.is_action_pressed("ui_up")):
		motion += Vector2(0,-1)
	if(Input.is_action_pressed("ui_down")):
		motion += Vector2(0,1)
	if(Input.is_action_pressed("ui_left")):
		motion += Vector2(-1,0)
	if(Input.is_action_pressed("ui_right")):
		motion += Vector2(1,0)
	if(Input.is_action_pressed("key_space")):
		scale.x+=0.01
		scale.y+=0.01
		rotate+=1
	
	var pos = img.get_pos()
	pos += motion * delta * SPEED
	img.set_pos(pos)
	
	img.set_scale(scale)
	img.set_rot(deg2rad(rotate))
	
