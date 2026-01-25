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
@onready var Prev_wish = $PrevWishContainter
@onready var Next_wish = $NextWishContainer
@onready var Make_wish = $MakeWishContainer
@onready var check_wish = $"../Chosen_UI/check_wish"

@onready var paper = $AudioStreamPlayer2D
var toyno = RandomNumberGenerator.new()
var wish_index: int = 0

var names = ["Joms", "Nian", "Andrea", "Joshua", "Sonny", "Renz", "Bujoi", "Wheelson", "Marc", "Adrian" ]

var toys = [ "Bear", "Baseball", "Dice", "Basketball", "Robot", "Crayons", "Dino", "Doll"]


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
		var name = names.pick_random()
		add(name)
		i += 1
	#mailprinter()
	
	
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
		var toy = toys.pick_random()
		array.append(toy)
		j += 1
		wishlist = str(array)
	print("The Wishlist is: ")
	print(wishlist)
	Global.wishlists[kid_name] = array

func _on_open_pressed() -> void:
	paper.play()
	Open.visible = false
	kid.visible = true
	exit.visible = true
	Prev_wish.visible = true
	Next_wish.visible = true
	Make_wish.visible = true
	mailprinter()

func _on_exitbutton_pressed() -> void:
	paper.play()
	print("titie")
	Open.visible = true
	kid.visible = false
	exit.visible = false
	Prev_wish.visible = false
	Next_wish.visible = false
	Make_wish.visible = false

func _on_mail_pressed() -> void:
	mailprinter()

func mailprinter():
	paper.play()
	if wish_index == 0: $"PrevWishContainter/Previous Wish".disabled = true
	else: $"PrevWishContainter/Previous Wish".disabled = false
	if wish_index == len(Global.wishlists)-1: $"NextWishContainer/Next Wish".disabled = true
	else: $"NextWishContainer/Next Wish".disabled = false
	
	print("opening mail")
	var kid = Global.wishlists.keys()[wish_index]
	#Global.current_child = kid
	var wishes = PackedStringArray(Global.wishlists[kid])
	Global.current_toys = wishes
	#print(kid)
	#print(wishes)
	letter_wishlist.text = "I want " + ", ".join(wishes) + " for Christmas Please"
	from_name.text = "From " + str(kid)


func _on_cycle_wish_pressed(num: int) -> void:
	var index = wish_index + num
	if index < 0 or index > len(Global.wishlists): return

	wish_index = index
	mailprinter()

var Check_wish: Dictionary[String, Array]

func _on_make_wish_pressed() -> void: #it should be put in the 
	paper.play()
	check_wish.visible = true
	Open.visible = true
	kid.visible = false
	exit.visible = false
	Prev_wish.visible = false
	Next_wish.visible = false
	Make_wish.visible = false
	Global.current_child = Global.wishlists.keys()[wish_index]
	print(Global.current_child)
	print(Global.current_toys)
