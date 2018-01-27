extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var vacio = load("res://heart_void.png")
var hot = load("res://heart_hot.png")
var cold = load("res://heart_cold.png")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	actu_vida()
#	var x=1;
#	while x<get_node("Player1").life + 1:
#		get_node("hot"+str(x)).set_texture(hot)
#		x=x+1
#	x=1;
#	while x<get_node("Player2").life + 1:
#		get_node("ice"+str(x)).set_texture(cold)
#		x=x+1
	#get_node("hot2").set_texture(vacio)
	#get_node("hot1").set_texture("res://heart_void.png")
	set_process(true)
	set_process_input(true)
	pass

func actu_vida():
	self.limpiar_vida()
	var x=1;
	while x<get_node("Player1").life + 1:
		get_node("hot"+str(x)).set_texture(hot)
		x=x+1
	x=1;
	while x<get_node("Player2").life + 1:
		get_node("ice"+str(x)).set_texture(cold)
		x=x+1
	

func limpiar_vida():
	var x=1;
	while x<6:
		get_node("hot"+str(x)).set_texture(vacio)
		get_node("ice"+str(x)).set_texture(vacio)
		x=x+1

func _input(event):
	if event.type == InputEvent.KEY && event.pressed == false:
		if event.scancode == KEY_Z:
			get_node("Player1").bajarVida()
			print(str(get_node("Player1").life))
			self.actu_vida()

func _process(delta):
	if(get_node("Player1").life==0):
		get_tree().change_scene("res://resultados.tscn")