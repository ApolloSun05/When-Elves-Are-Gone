extends Node2D

@onready var credits_ui: CanvasLayer = $CreditsUI

func _on_start_game_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main scenes/mailarea.tscn")

func _on_credits_pressed() -> void:
	credits_ui.visible = true

func _on_button_pressed() -> void:
	credits_ui.visible = false
