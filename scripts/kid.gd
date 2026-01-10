extends Node2D

@export var kid_name: String = ""
@export var wishlist: String = ""
@export var is_naughty = ""

@onready var Open = $"Mail Open"
@onready var kid = $kidmail
@onready var exit = $Exit
@onready var letter_wishlist = $kidmail/mail/wish
@onready var from_name =$kidmail/mail/bottom
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
	mailprinter()
	
func add(name) -> void:
	print("The Kid Name Is:")
	kid_name = name
	print(kid_name)
	var array = []
	
	var x = RandomNumberGenerator.new()
	x.randomize()
	var no_of_toys = x.randi_range(1, 5)
	
	#print("for " + name + " there are " + str(no_of_toys) + " of toys")
	
	var j:int = 0
	
	while j < no_of_toys:
		toyno.randomize()
		var toy = toyno.randi_range(1, 8)
		array.append(toys[toy])
		j += 1
		wishlist = str(array)
	print("The Wishlist is: ")
	print(wishlist)

func _on_open_pressed() -> void:
	Open.visible = false
	kid.visible = true
	exit.visible = true

func _on_exitbutton_pressed() -> void:
	Open.visible = true
	kid.visible = false
	exit.visible = false

func _on_mail_pressed() -> void:
	mailprinter()

func mailprinter():
	letter_wishlist.text = "I want " + wishlist + " for Christmas Please"
	from_name.text = "From " + str(kid_name)
