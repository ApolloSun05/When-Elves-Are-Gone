extends Node2D

var bear = preload("res://scenes/gifts/bear.tscn")

func _ready() -> void:
	inst(Vector2(200, 200))
	
func inst(pos):
	var bearinstance = bear.instantiate()
	bearinstance.position = pos
	add_child(bearinstance)
	
