extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

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
	pass

func actu_vida():
	self.limpiar_vida()
	var x=1;
	while x<get_node("Player1").life + 1:
		get_node("hot"+str(x)).set_texture(global.hot)
		x=x+1
	x=1;
	while x<get_node("Player2").life + 1:
		get_node("ice"+str(x)).set_texture(global.cold)
		x=x+1
	

func limpiar_vida():
	var x=1;
	while x<6:
		get_node("hot"+str(x)).set_texture(global.vacio)
		get_node("ice"+str(x)).set_texture(global.vacio)
		x=x+1

func _process(delta):
	if(get_node("Player1").life==0):
		get_tree().change_scene("res://resultados.tscn")