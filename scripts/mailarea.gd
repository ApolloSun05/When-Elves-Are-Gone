extends Node2D

@onready var time_label: Label = $"Timer/Time Label"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Bgm.play_music_level()
	Global.midnight.connect(
	func():
		get_tree().change_scene_to_file("res://scenes/main scenes/delivery.tscn")
		)
	Global.start_game()
