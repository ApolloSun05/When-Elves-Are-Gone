extends Node2D

@export var kid_name = ""
@export var wishlist = ""
@export var is_naughty = ""

@onready var Open = $"Mail Open"
@onready var kid = $kidmail
@onready var exit = $Exit
@onready var from = $"Actual Mail/MarginContainer/childname"
@onready var letter = $"Actual Mail/MarginContainer/sample"
var wisher = RandomNumberGenerator.new()
var toyno = RandomNumberGenerator.new()

var names = {
	1: "Joms",
	2: "Nian",
	3: "Andrea",
	4: "Joshua",
	5: "Sonny",
	6: "Renz",
	7: "Bujoi",
	8: "Wheelson",
	9: "Marc",
	10: "Adrian"
}

var toys = {
	1: "Teddy Bear",
	2: "Toy Car",
	3: "Doll",
	4: "Ball",
	5: "Toy Robot",
	6: "Mini Dinosaur",
	7: "Remote Control Car",
	8: "Toy Robot"
}

var wishlists = {}
var listofwishers = []
func _ready():
	Open.visible = true
	kid.visible = false
	exit.visible = false
	var i: int = 0
	print("there should be atleast " + str(Global.nchildren) + " children")
	while i < Global.nchildren:
		wisher.randomize()
		var name = wisher.randi_range(1, 10)
		add(names[name])
		i += 1
	#mailprinter()
	
func add(name) -> void:
	listofwishers.append(name)
	var array = []
	
	var x = RandomNumberGenerator.new()
	x.randomize()
	var no_of_toys = x.randi_range(1, 5)
	
	print("for " + name + " there are " + str(no_of_toys) + " of toys")
	
	var j:int = 0
	
	while j < no_of_toys:
		toyno.randomize()
		var toy = toyno.randi_range(1, 8)
		array.append(toys[toy])
		j += 1
		wishlists[name] = array

func _on_open_pressed() -> void:
	Open.visible = false
	kid.visible = true
	exit.visible = true

func _on_exitbutton_pressed() -> void:
	print("naclick namn")
	Open.visible = true
	kid.visible = false
	exit.visible = false

func _on_mail_pressed() -> void:
	pass
#	mailprinter()

#func mailprinter():
#	print(wishlists)
#	var x:int = 0
#	letter.text = "I want " + str(wishlists[listofwishers[x]]) + " for Christmas Please"
#	from.text = "From " + str(listofwishers[x])
