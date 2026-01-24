extends Node2D

signal inventory_opened
signal inventory_updated
signal drag_started
signal drag_ended

var children = RandomNumberGenerator.new()
var nchildren: int

var is_dragging = false
var nights: int = 1

var wishlists: Dictionary[String, Array]
var current_child: String
var current_toys: Array
var current_house: String = ""
var wrapped_toys: Array
var inventory: Dictionary[String, Array] = {}

var score: int = 0

@onready var slot_scene = preload("res://scenes/canvas scenes/inventory_slot.tscn")

func _ready() -> void:
	children.randomize()
	if nights < 3:
		nchildren = children.randi_range(2,5)
	else: 
		nchildren = children.randi_range(2,10)

func deliver(key: String) -> void:
	if key == current_house:
		score += 10
	else:
		score -= 10
	inventory.erase(key)
	inventory_updated.emit()
	print("DELIVERED")
