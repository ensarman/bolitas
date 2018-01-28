extends Node

var score1
var score2
enum { ESTADO_NEUTRAL, ESTADO_PLAYER1, ESTADO_PLAYER2 }
enum { PLAYER_1, PLAYER_2 }

func _ready():
	# puntajes iniciales
	score1 = 0
	score2 = 0