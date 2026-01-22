extends StaticBody2D

@onready var panel = $ColorRect
@onready var Check = $Check_Wrapped_Toys
signal wrapped(toy_name: String)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Global.is_dragging:
		panel.visible = true
	else:
		panel.visible = false

var child_name: String
var gifts_inserted = []


	
func _on_gifts_wrapped(toy_name: String) -> void:
	print("WTFFF")
	Global.current_toys.append(toy_name)


func _on_check_wrapped_toys_pressed() -> void:
	print("clicked")
	
