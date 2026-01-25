extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	Global.inventory[Global.current_child] = Global.wrapped_toys.duplicate_deep()
	Global.current_child = str(len(Global.inventory))
	Global.wrapped_toys.clear()
	Global.inventory_updated.emit()
	print("HELLYEAHH")
