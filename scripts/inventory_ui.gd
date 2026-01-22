extends Control

@onready var Grid = $GridContainer
@onready var Santa_bag = $"../../Santas_Bag/MarginContainer"

func _ready() -> void:
	Global.inventory_opened.connect(func ():
		self.visible = true
		print("[LOG] Inventory Opened"))
	Global.inventory_updated.connect(_on_inventory_updated)
	_on_inventory_updated()

func _process(delta: float) -> void:
	pass

func _on_inventory_updated():
	print("[LOG] Inventory updated")
	clear_grid_container()
	
	for child in Global.inventory.keys():
		prints("[LOG] adding gift", Global.inventory[child])
		var slot = Global.slot_scene.instantiate()
		var gift = Global.inventory[child]
		Grid.add_child(slot)
		if gift != null:
			slot.set_item(gift)
			#pass
		else:
			slot.set_empty()
		#print("[LOG] Slot added to inventory")
	
func clear_grid_container():
	for child in Grid.get_children():
		child.queue_free()

func _on_close_bag_pressed() -> void:
	self.visible = false
	Santa_bag.visible = true
