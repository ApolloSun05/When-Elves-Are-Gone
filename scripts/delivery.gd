extends Node2D


func _on_score_boardnext_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main scenes/scoreboard.tscn")
