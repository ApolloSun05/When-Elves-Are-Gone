extends Node2D

signal inventory_opened
signal inventory_updated
signal time_updated
signal drag_started
signal drag_ended
signal midnight
signal night_end
signal night_start

var children = RandomNumberGenerator.new()
var nchildren: int
var naughty_children: Array[String] = []
var correct_children: int
var correct_gifts: int

var is_dragging = false
var nights: int = 0

var wishlists: Dictionary[String, Array]
var current_child: String
var current_toys: Array
var current_house: String

#{"Joms": [], "Nian": [], "Andrea": [], "Joshua": [], "Sonny": [], "Renz": [], "Bujoi": [], "Wheelson": [], "Marc": [], "Adrian": []}
var wrapped_toys: Array
var inventory: Dictionary[String, Array] = {}

var faith: int = 0

var current_time: float = 7
var end_time: float = 12

var timer: Timer

@onready var slot_scene = preload("res://scenes/canvas scenes/inventory_slot.tscn")

func _ready() -> void:
	timer = Timer.new()
	timer.autostart = false
	timer.one_shot = false
	timer.wait_time = 1
	timer.timeout.connect(_update_timer)
	add_child(timer)

func deliver(key: String) -> void:
	if current_house == key:
		print("tamang bahay")
		faith += 100
		correct_children += 1
		prints("Delivering to", key, naughty_children.find(key))
		if naughty_children.find(key) == -1 and inventory[key] == wishlists[key]:
			correct_gifts += len(wishlists[key])
			print("MAY TAMA KA")
			faith += 100
		elif naughty_children.find(key) != -1 and inventory[key].find("Coal") == -1:
			faith -= 50
			print("mali mo yon")
		else:
			print("mali haha")
			faith -= 10
	else:
		print("maling bahay")
		faith -= 10
	inventory.erase(key)
	inventory_updated.emit()
	print("DELIVERED")

func start_game() -> void:
	# reset stuff
	timer.stop()
	children.randomize()
	if nights < 3:
		nchildren = children.randi_range(2,5)
		prints("NCHILDREN", nchildren)
	else: 
		nchildren = children.randi_range(2,10)
	current_time = 7.0
	end_time = 12.0
	timer.start()
	nights += 1
	wishlists.clear()
	inventory.clear()
	current_toys.clear()
	wrapped_toys.clear()
	current_child = ""
	current_house = ""
	correct_children = 0
	correct_gifts = 0
	night_start.emit()

func end_game() -> void:
	faith += (correct_children*100) + (correct_gifts*100)
	night_end.emit()
	
func _update_timer() -> void:
	current_time += 1.0/60.0
	time_updated.emit()
	if current_time >= end_time:
		timer.stop()
		print("tigil na")
		midnight.emit()
