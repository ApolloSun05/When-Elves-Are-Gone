extends Node2D

func _ready() -> void:
	print("hmmmm")
	Global.midnight.connect(
	func():
		print("hatinggabi na")
		get_tree().change_scene_to_file("res://scenes/main scenes/delivery.tscn")
		)
