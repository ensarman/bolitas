extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_process(true)
	pass

func _process(delta):
	# FIXME: extremadamente ineficiente
	cambiar_puntaje(global.score1,global.score2)

func cambiar_puntaje(score1, score2):
	var formato_lbl_puntaje = "%s | %s"
	get_node("Puntaje").set_text(formato_lbl_puntaje % [score1 , score2])