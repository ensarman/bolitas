extends KinematicBody2D

func AjustaVida_2(Personaje_Origen):
	Personaje_Origen -= 1 #esto es solo temporal arreglar este bug
	if Personaje_Origen == global.PLAYER_1:
		print("player1")
		global.VIDA2 -=1
		if global.VIDA2 == 0:
			get_tree().change_scene("res://resultados.tscn")
	else:
		print("player2")
		global.VIDA1 -=1
		if global.VIDA1 == 0:
			get_tree().change_scene("res://resultados.tscn")

func _ready():
	pass
