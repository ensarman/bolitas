extends RigidBody2D

var acceleration = 1000
var top_move_speed = 200
var top_jump_speed = 400
var life=5

var directional_force = Vector2()

var PLAYER_ORIGEN

const DIRECTION = {
	ZERO=Vector2(0,0),
	LEFT=Vector2(-1,0),
	RIGHT=Vector2(1,0),
	UP=Vector2(0,-1),
	DOWN=Vector2(0,1)
}

func _ready():
	# para activar detección de colisiones
	set_contact_monitor( true )
	set_max_contacts_reported( 5 )
	connect("body_enter",self,"collision_now")
	life=5

# detección de colisiones
func collision_now(who):
#	if (who.get_name() == "BolaNodo"):
	if (who.get_name().substr(0,8) == "BolaNodo"):
		who.cambiar_estado(PLAYER_ORIGEN)
	if (who.get_name().substr(0,7) == "Enemigo"):
		self.AjustaVida_2(PLAYER_ORIGEN)
	if who.get_name().substr(0,6) == "Player":
		# cuando dos jugadores chocan le restamos la vida a ambos
		# solo hay una llamada xq este método se llama por cada jugador
		self.AjustaVida_2(PLAYER_ORIGEN)

func AjustaVida_2(Personaje_Origen):
	# FIXME: el problema es en la clase personaje.gd, 
	# el valor inicial de PLAYER_ORIGEN
	Personaje_Origen -= 1 
	get_parent().get_node("SamplePlayer2D 2").play("hurt04")
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

func _integrate_forces(state):
	#fuerza final
	var final_force = Vector2()
	
	directional_force = DIRECTION.ZERO
	
	apply_force(state)
	
	final_force = state.get_linear_velocity() + (directional_force * acceleration)
	
	if (final_force.x > top_move_speed):
		final_force.x = top_move_speed
	elif (final_force.x < -top_move_speed):
		final_force.x = -top_move_speed
		
	if (final_force.y > top_jump_speed):
		final_force.y = top_jump_speed
	elif (final_force.y < -top_jump_speed):
		final_force.y = -top_jump_speed
		
	state.set_linear_velocity(final_force)
	
func apply_force(state):
	pass

func check_movement(player):
	"""
	Mueve al jugador dependiendo si player es PLAYER_1 o PLAYER_2
	"""
	if player==global.PLAYER_1:
		if (Input.is_action_pressed("move_left")):
			directional_force += DIRECTION.LEFT
		if (Input.is_action_pressed("move_right")):
			directional_force += DIRECTION.RIGHT
		if (Input.is_action_pressed("move_jump")):
			directional_force += DIRECTION.UP
	elif player==global.PLAYER_2:
		if (Input.is_action_pressed("ui_left")):
			directional_force += DIRECTION.LEFT
		if (Input.is_action_pressed("ui_right")):
			directional_force += DIRECTION.RIGHT
		if (Input.is_action_pressed("ui_jump")):
			directional_force += DIRECTION.UP
		
