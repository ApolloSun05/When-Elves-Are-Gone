extends CanvasLayer

@onready var Total = $MarginContainer/Total
@onready var Children = $MarginContainer/MarginContainer/Children
@onready var Gifts  = $MarginContainer/MarginContainer/Gifts
func _ready() -> void: 
	Children.text = "Children: " + Global.right_children + "/" + Global.nchildren + Global.faith
	Global.nchildren 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
