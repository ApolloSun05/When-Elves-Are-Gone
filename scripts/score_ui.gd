extends CanvasLayer

@onready var Total = $MarginContainer/Total
@onready var Children = $MarginContainer/MarginContainer/Children
@onready var Gifts  = $MarginContainer/MarginContainer/Gifts
func _ready() -> void: 
	Children.text = "Children: " + str(Global.correct_children * 100)
	Gifts.text = "Gifts: " + str(Global.correct_gifts * 100)
	Total.text = "Faith: " + str(Global.faith)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
