extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var estado = global.ESTADO_NEUTRAL

signal cambio_de_puntaje

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)

func _process(delta):
	#cambiar_frame_sprite()
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
	#global.score1+=2
	#global.score2+=5

func AjustaVida(Personaje_Origen):
	if Personaje_Origen == global.PLAYER_1:
		if global.VIDA1 < 5:
			global.VIDA1 +=1
		global.VIDA2 -=1
		if global.VIDA2 == 1:
			get_tree().change_scene("res://resultados.tscn")
	else:
		global.VIDA1 -=1
		if global.VIDA2 == 1:
			get_tree().change_scene("res://resultados.tscn")
		if global.VIDA2 < 5:
			global.VIDA2 +=1

func check_colision():
	#get_node("CollisionShape2D").
	pass

func cambiar_frame_sprite():
	if Input.is_action_pressed("cambio_1"):
		print('Z')
		cambiar_estado(global.ESTADO_PLAYER1)
	elif Input.is_action_pressed("cambio_2"):
		print('X')
		cambiar_estado(global.ESTADO_PLAYER2)
		
