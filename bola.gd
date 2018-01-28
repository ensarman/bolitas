extends KinematicBody2D

var estado = global.ESTADO_NEUTRAL

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)

func _process(delta):
	pass

func cambiar_estado(nuevo_estado):
	# no hay cambio!	
	if estado == nuevo_estado:
		return

	# cuando cambia de neutral
	if estado == global.ESTADO_NEUTRAL:
		if nuevo_estado == global.ESTADO_PLAYER1:
			global.score1 += 1
			AjustaVida(global.PLAYER_1)
		elif nuevo_estado == global.ESTADO_PLAYER2:
			global.score2 += 1
			AjustaVida(global.PLAYER_2)
	elif estado == global.ESTADO_PLAYER1:
		if nuevo_estado == global.ESTADO_PLAYER2:
			global.score1 -= 1
			global.score2 += 1
			AjustaVida(global.PLAYER_2)
	elif estado == global.ESTADO_PLAYER2:
		if nuevo_estado == global.ESTADO_PLAYER1:
			global.score1 += 1
			global.score2 -= 1
			AjustaVida(global.PLAYER_1)
	
	# actualizamos el estado
	estado = nuevo_estado
	get_node("BolaSprite").set_frame(nuevo_estado)
	get_node("BolaSprite").update()


func AjustaVida(Personaje_Origen):
	get_parent().get_node("SamplePlayer2D 2").play("click")
	if Personaje_Origen == global.PLAYER_1:
		if global.ESTADO_NEUTRAL != estado:
			global.VIDA2 -=1
		if global.VIDA2 == 0:
			get_tree().change_scene("res://resultados.tscn")
	else:
		if global.ESTADO_NEUTRAL != estado:
			global.VIDA1 -=1
		if global.VIDA1 == 0:
			get_tree().change_scene("res://resultados.tscn")