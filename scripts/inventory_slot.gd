extends Control

@onready var Gift_Desc = $Gift_Desc
@onready var Gift_list = $Gift_Desc/Margin/Label
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Gift_Desc.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_mouse_entered() -> void:
	Gift_Desc.visible = true
	Gift_list.text = "> " + "\n> ".join(Global.wishes_temp)
	
func _on_button_mouse_exited() -> void:
	Gift_Desc.visible = false

func set_empty():
	Gift_list.text = ""
	
