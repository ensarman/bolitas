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
	print('hcua')	
	# cuando cambia de neutral
	if estado == global.ESTADO_NEUTRAL:
		if nuevo_estado == global.ESTADO_PLAYER1:
			global.score1 += 1
		elif nuevo_estado == global.ESTADO_PLAYER2:
			global.score2 += 1
	elif estado == global.ESTADO_PLAYER1:
		if nuevo_estado == global.ESTADO_PLAYER2:
			global.score1 -= 1
			global.score2 += 1
	elif estado == global.ESTADO_PLAYER2:
		if nuevo_estado == global.ESTADO_PLAYER1:
			global.score1 += 1
			global.score2 -= 1
	
	# actualizamos el estado
	estado = nuevo_estado
	get_node("BolaSprite").set_frame(nuevo_estado)
	get_node("BolaSprite").update()
	#global.score1+=2
	#global.score2+=5

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
		
