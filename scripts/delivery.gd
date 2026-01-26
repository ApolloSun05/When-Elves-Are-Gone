extends Node2D

@onready var label: Label = $CanvasLayer/ScoreBoardnext/Label

func _on_score_boardnext_pressed() -> void:
	Bgm.play_music_level()
	get_tree().change_scene_to_file("res://scenes/main scenes/scoreboard.tscn")

func _on_score_boardnext_mouse_entered() -> void:
	label.add_theme_color_override("font_color", Color.WHITE)

func _on_score_boardnext_mouse_exited() -> void:
	label.add_theme_color_override("font_color", Color.from_rgba8(150, 75, 0))
