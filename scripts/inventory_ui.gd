extends Control

@onready var Grid = $GridContainer
func _ready() -> void:
	_on_inventory_updated()

func _process(delta: float) -> void:
	pass

func _on_inventory_updated():
	clear_grid_container()
	
	for gift in Global.inventory:
		var slot = Global.slot_scene.instantiate()
		Grid.add_child(slot)
		if gift != null:
			slot.set_item(gift)
		else:
			slot.set_empty
	
func clear_grid_container():
	while Grid.get_child_count() >0:
		var child = Grid.get_child(0)
		Grid.remove_child(child)
		child.queue_free()
