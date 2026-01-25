extends Node2D

@onready var time_label: Label = $"Timer/Time Label"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.time_updated.connect(_update_timer)
	Global.start_game()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _update_timer() -> void:
	var hours: int = int(Global.current_time)
	var minutes_float = Global.current_time - hours
	var minutes: int = minutes_float * 60
	time_label.text = str(hours).pad_zeros(2) + ":" + str(minutes).pad_zeros(2) + " PM" if Global.current_time < Global.end_time else " AM"
	pass
