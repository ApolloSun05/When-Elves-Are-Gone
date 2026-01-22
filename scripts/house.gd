extends Node2D

@onready var DelPanel = $DeliverPanel
@onready var inventory_ui: Control = $"../CanvasLayer/Inventory_UI"

func _ready() -> void:
	DelPanel.visible = false

func _input(event: InputEvent) -> void:
	if DelPanel.visible:
		if event is InputEventKey and event.is_pressed() and event.keycode == 70:
			inventory_ui.visible = not inventory_ui.visible

func _on_area_2d_body_entered(body: Node2D) -> void:
	DelPanel.visible = true
	print("im in")

func _on_area_2d_body_exited(body: Node2D) -> void:
	DelPanel.visible = false
	print("im out")

func _on_deliver_pressed() -> void:
	#open UI
	pass
