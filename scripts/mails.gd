extends CanvasLayer

@onready var Open = $"Mail Open"
@onready var Mails = $"Actual Mail"
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
	4: "Lego Set",
	5: "Action Figure",
	6: "Rubber Duck",
	7: "Yo-Yo",
	8: "Puzzle",
	9: "Stuffed Bunny",
	10: "Train Set",
	11: "Toy Robot",
	12: "Building Blocks",
	13: "Ball",
	14: "Remote Control Car",
	15: "Mini Dinosaur"
}
var arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Open.visible = true
	Mails.visible = false
	exit.visible = false
	wisher.randomize()
	
	test(Global.x)
	var n = wisher.randi_range(1,10)
	toyno.randomize()
	var x = toyno.randi_range(1, 15)
	mailprinter(n, x)

func test(number):
	var i:int = 0
	print(number)
	print("the random number is (Mails)" + str(number))
	while i != number:
		print(arr[i])
		i += 1
		
func _on_open_pressed() -> void:
	Open.visible = false
	Mails.visible = true
	exit.visible = true

func _on_exitbutton_pressed() -> void:
	Open.visible = true
	Mails.visible = false
	exit.visible = false

func _on_mail_pressed() -> void:
	pass # Replace with function body.

func mailprinter(n, x):
	letter.text = "I want " + toys[x] + " for Christmas Please"
	from.text = "From " + names[n]
