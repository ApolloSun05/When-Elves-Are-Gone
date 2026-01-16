extends Node2D

var children = RandomNumberGenerator.new()
var nchildren: int

var is_dragging = false
var nights: int = 1

var wishlists: Dictionary[String, Array]
var current_child: String
var current_toys: Array[String]
var inventory: Dictionary[String, Array] = {}

var kid_temp: String # to be used in a fcuntion
var wishes_temp: Array

func _ready() -> void:
	children.randomize()
	if nights < 3:
		nchildren = children.randi_range(2,5)
	else: 
		nchildren = children.randi_range(2,10)
