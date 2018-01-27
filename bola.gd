extends StaticBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

enum { ESTADO_NEUTRAL, ESTADO_PLAYER1, ESTADO_PLAYER2 }

var estado = ESTADO_NEUTRAL

signal cambio_de_puntaje

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)

func _process(delta):
	cambiar_frame_sprite()

func cambiar_estado(nuevo_estado):
	estado = nuevo_estado
	get_node("BolaSprite").set_frame(nuevo_estado)
	# todo: agregar lógica de restas de puntajes y sumas
	global.score1+=2
	global.score2+=5

func check_colision():
	#get_node("CollisionShape2D").
	pass

func cambiar_frame_sprite():
	if Input.is_action_pressed("cambio_1"):
		print('Z')
		cambiar_estado(ESTADO_PLAYER1)
	elif Input.is_action_pressed("cambio_2"):
		print('X')
		cambiar_estado(ESTADO_PLAYER2)
		
