extends CanvasLayer

@onready var check_wish = $check_wish
@onready var chosen_wish = $chosen_wish

@onready var chosenkid_text = $chosen_wish/MarginContainer/chosen_kid 
@onready var chosenarray_text = $chosen_wish/MarginContainer/chosen_array

func _on_checkchosenwish_pressed() -> void:
	chosenkid_text.text = "Kid: " + Global.current_child
	chosenarray_text.text = "Checklist: \n> " + "\n> ".join(Global.current_toys)
	check_wish.visible = false
	chosen_wish.visible = true
	if Global.naughty_children.find(Global.current_child) != -1:
		chosenkid_text.add_theme_color_override("font_color", Color.RED) 
	else:
		chosenkid_text.add_theme_color_override("font_color", Color.from_rgba8(150, 75, 0))
	
	
func _on_close_chosenwish_pressed() -> void:
	check_wish.visible = true
	chosen_wish.visible = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	chosen_wish.visible = false
	if Global.current_child == "" and Global.current_toys == []:
		check_wish.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
