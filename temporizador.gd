extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var tiempo2

func _ready():
	pass

func _on_Timer_timeout():
	get_node("txtTiempo").set_text(str(global.TIEMPO)+" segundos")
	global.TIEMPO-=1
	if(global.TIEMPO<0):
		get_tree().change_scene("res://resultados.tscn")
