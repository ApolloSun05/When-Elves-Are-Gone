extends CanvasLayer

@onready var Total = $MarginContainer/Total
@onready var Children = $MarginContainer/MarginContainer/Children
@onready var label: Label = $"Next Night/Label"

func _ready() -> void: 
	Children.text = "Children: " + str(Global.correct_children * 100)
	Total.text = "Faith: " + str(Global.faith)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_next_night_pressed() -> void:
	Global.end_game()
	Global.next_night()
	get_tree().change_scene_to_file("res://scenes/main scenes/mailarea.tscn")
	pass # Replace with function body.

func _on_next_night_mouse_entered() -> void:
	label.add_theme_color_override("font_color", Color.WHITE)

func _on_next_night_mouse_exited() -> void:
	label.add_theme_color_override("font_color", Color.from_rgba8(150, 75, 0))
