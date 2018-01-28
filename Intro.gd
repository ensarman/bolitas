extends Node2D

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _on_Timer_timeout():
	get_tree().change_scene("res://Menu.tscn")
