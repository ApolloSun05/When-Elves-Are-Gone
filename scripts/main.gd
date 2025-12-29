extends CanvasLayer

@onready var quota = $textbox/MarginContainer/HBoxContainer/NoofChildren
var children = RandomNumberGenerator.new()
var nchildren: int = 0
var x: int = 0
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	children.randomize()
	nchildren = children.randi_range(1,10)
	x = nchildren
	print("the random number is (Main)" + str(x))
	if quota == null:
		pass
	else:
		add_text(x)

func add_text(number):
	print(number)
	quota.text = str(number)
	# !!!!! Pahelp, iba ung printed number sa UI and dun sa variable x. !!!!!
	# !!!!! we need that number para macode sa game how many children to serve !!!!!
	
