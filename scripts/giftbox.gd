extends StaticBody2D

@onready var panel = $ColorRect
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Global.is_dragging:
		panel.visible = true
	else:
		panel.visible = false

var child_name = []
var gifts_inserted = []

func get_data(node):
	child_name.append(node.name)
	gifts_inserted.append(node.array)
	print("I guess it worked??")

#func _on_area_entered(area: Area2D) -> void:
	#var item = area.get_parent()
	#if is_instance_of(item, Gift):
		#print(item.toy_name)
	#pass # Replace with function body.
