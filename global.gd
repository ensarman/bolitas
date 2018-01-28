extends Node

var score1
var score2
enum { ESTADO_NEUTRAL, ESTADO_PLAYER1, ESTADO_PLAYER2 }
enum { PLAYER_1, PLAYER_2 }
var VIDA1 = 5
var VIDA2 = 5

var vacio = load("res://heart_void.png")
var hot = load("res://heart_hot.png")
var cold = load("res://heart_cold.png")


func _ready():
	# puntajes iniciales
	score1 = 0
	score2 = 0