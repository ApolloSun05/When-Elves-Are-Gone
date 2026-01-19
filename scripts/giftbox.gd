extends StaticBody2D

@onready var panel = $ColorRect
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

	

#func _on_area_entered(area: Area2D) -> void:
	#var item = area.get_parent()
	#if is_instance_of(item, Gift):
		#print(item.toy_name)
	#pass # Replace with function body.
	
func _on_gifts_wrapped(toy_name: String) -> void:
	print("WTFFF")
	Global.current_toys.append(toy_name)
