extends Node2D


func _on_score_boardnext_pressed() -> void:
	Bgm.play_music_level()
	get_tree().change_scene_to_file("res://scenes/main scenes/scoreboard.tscn")
