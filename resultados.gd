extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var puntHot=global.score2
	var puntIce=global.score1
	var vidaHot=global.VIDA1
	var vidaIce=global.VIDA2
	if (puntHot<puntIce):
		get_node("mensaje").set_text("Gana el jugador hielo %d a %d" % [puntIce,puntHot])
	elif (puntHot>puntIce):
		get_node("mensaje").set_text("Gana el jugador fuego %d a %d" % [puntHot,puntIce])
	else:
		if(vidaHot<vidaIce):
			get_node("mensaje").set_text("Por su vida gana el jugador hielo %d a %d" % [vidaIce,vidaHot])
		elif(vidaHot>vidaIce):
			get_node("mensaje").set_text("Por su vida gana el jugador fuego %d a %d" % [vidaHot,vidaIce])
		else:
			get_node("mensaje").set_text("Empateee!!! %d a %d" % [vidaHot,vidaIce])
		


func _on_TextureButton_pressed():
	get_tree().change_scene("res://menu.tscn")
