extends Control

@onready var Grid = $GridContainer
var Santa_bag

func _ready() -> void:
	Global.inventory_opened.connect(func ():
		self.visible = true
		print("[LOG] Inventory Opened"))
	Global.inventory_updated.connect(_on_inventory_updated)
	_on_inventory_updated()
	if get_parent().get_parent().name == "giftwrapping": Santa_bag = $"../../Santas_Bag/MarginContainer"

func _on_inventory_updated():
	print("[LOG] Inventory updated")
	clear_grid_container()
	
	for child in Global.inventory.keys():
		prints("[LOG] adding gift", Global.inventory[child])
		var slot = Global.slot_scene.instantiate()
		var gift = Global.inventory[child]
		print(Global.inventory[child])
		Grid.add_child(slot)
		if gift != null:
			slot.set_item(gift, child)
			print("Hesitations never helps!")
			#pass
		else:
			print("All i long for is your touch!")
			slot.set_empty()
		#print("[LOG] Slot added to inventory")
	
func clear_grid_container():
	for child in Grid.get_children():
		child.queue_free()

func _on_close_bag_pressed() -> void:
	self.visible = false
	if Santa_bag: Santa_bag.visible = true
