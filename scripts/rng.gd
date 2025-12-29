extends Node2D

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	var i = rng.randi_range(1,15)
	print(i)
