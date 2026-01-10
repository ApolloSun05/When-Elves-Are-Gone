extends Node2D

var children = RandomNumberGenerator.new()
var nchildren: int = 1

var is_dragging = false
var nights: int = 1

func _ready() -> void:
	pass
	#children.randomize()
	#if nights < 3:
		#nchildren = children.randi_range(2,5)
	#else: 
		#nchildren = children.randi_range(2,10)
