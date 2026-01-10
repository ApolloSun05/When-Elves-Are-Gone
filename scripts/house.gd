extends Node2D

@onready var DelPanel = $DeliverPanel

func _ready() -> void:
	DelPanel.visible = false
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	DelPanel.visible = true
	print("im in")


func _on_area_2d_body_exited(body: Node2D) -> void:
	DelPanel.visible = false
	print("im out")


func _on_deliver_pressed() -> void:
	#open UI
	pass
