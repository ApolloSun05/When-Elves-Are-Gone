class_name Kid
extends Node2D

@export var kid_name: String = ""
@export var wishlist: String = ""
@export var is_naughty = ""

@onready var Open = $"Mail Open"
@onready var kid = $kidmail
@onready var exit = $Exit
@onready var letter_wishlist = $kidmail/mail/wish
@onready var from_name =$kidmail/mail/bottom
@onready var Prev_wish = $"Previous Wish"
@onready var Next_wish = $"Next Wish"
@onready var Make_wish = $"Make Wish"
@onready var check_wish = $check_wish
@onready var chosen_wish = $chosen_wish
var wisher = RandomNumberGenerator.new()
var toyno = RandomNumberGenerator.new()
var wish_index: int = 0

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


func _ready():
	Open.visible = true
	kid.visible = false
	exit.visible = false
	Prev_wish.visible = false
	Next_wish.visible = false
	Make_wish.visible = false
	var i: int = 0
	print("there should be atleast " + str(Global.nchildren) + " children")
	while i < Global.nchildren:
		wisher.randomize()
		var name = wisher.randi_range(1, 10)
		add(names[name])
		i += 1
	#mailprinter()
	if Global.kid_temp == "" and Global.wishes_temp == []:
		check_wish.visible = false
		chosen_wish.visible = false
	
func add(name: String) -> void:
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
	Global.wishlists[kid_name] = array

func _on_open_pressed() -> void:
	Open.visible = false
	kid.visible = true
	exit.visible = true
	Prev_wish.visible = true
	Next_wish.visible = true
	Make_wish.visible = true
	mailprinter()

func _on_exitbutton_pressed() -> void:
	Open.visible = true
	kid.visible = false
	exit.visible = false
	Prev_wish.visible = false
	Next_wish.visible = false
	Make_wish.visible = false

func _on_mail_pressed() -> void:
	mailprinter()

func mailprinter():
	
	if wish_index == 0: $"Previous Wish".disabled = true
	else: $"Previous Wish".disabled = false
	if wish_index == len(Global.wishlists)-1: $"Next Wish".disabled = true
	else: $"Next Wish".disabled = false
	
	print("opening mail")
	var kid = Global.wishlists.keys()[wish_index]
	Global.kid_temp = kid
	var wishes = PackedStringArray(Global.wishlists[kid])
	Global.wishes_temp = wishes
	print(kid)
	print(wishes)
	letter_wishlist.text = "I want " + ", ".join(wishes) + " for Christmas Please"
	from_name.text = "From " + str(kid)


func _on_cycle_wish_pressed(num: int) -> void:
	var index = wish_index + num
	if index < 0 or index > len(Global.wishlists): return
	
	wish_index = index
	mailprinter()

var Check_wish: Dictionary[String, Array]

func _on_make_wish_pressed() -> void: #it should be put in the 
	check_wish.visible = true
	Open.visible = true
	kid.visible = false
	exit.visible = false
	Prev_wish.visible = false
	Next_wish.visible = false
	Make_wish.visible = false
	
	print(Global.kid_temp)
	print(Global.wishes_temp)

@onready var chosenkid_text = $chosen_wish/MarginContainer/chosen_kid 
@onready var chosenarray_text = $chosen_wish/MarginContainer/chosen_array

func _on_checkchosenwish_pressed() -> void:
	chosenkid_text.text = "Kid: " + Global.kid_temp
	chosenarray_text.text = "Checklist: \n> " + "\n> ".join(Global.wishes_temp)
	check_wish.visible = false
	chosen_wish.visible = true
	
	
func _on_close_chosenwish_pressed() -> void:
	check_wish.visible = true
	chosen_wish.visible = false
