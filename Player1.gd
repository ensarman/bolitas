extends "res://personaje.gd"

func _ready():
#	acceleration = 1000
#	top_move_speed = 200
#	top_jump_speed = 300
	set_contact_monitor( true )
	set_max_contacts_reported( 5 )
	connect("body_enter",self,"collision_now")

func collision_now(who):
	print(self.get_name()," is colliding with ",who.get_name())
	
func apply_force(state):
	check_movement(PLAYER_1)