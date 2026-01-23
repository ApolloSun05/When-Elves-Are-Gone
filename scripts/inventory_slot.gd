extends Control

@onready var Gift_Desc = $Gift_Desc
@onready var child_name = $MarginContainer/MarginContainer/Child_Name
@onready var gift_details: Label = $"Gift_Desc/Margin/Gift Details"
@onready var gift_style = $MarginContainer/Sprite2D
@onready var empty_box = preload("res://assets/close box.png")
@onready var textures = [
	preload("res://assets/gift wrapper.png"),
	preload("res://assets/gift wrapper (violet_green_2).png"),
	preload("res://assets/gift wrapper (violet_green).png"),
	preload("res://assets/gift wrapper (red_blue).png")
]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Gift_Desc.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_mouse_entered() -> void:
	Gift_Desc.visible = true
	gift_details.text = "> " + "\n> ".join(Global.wrapped_toys)
	
func _on_button_mouse_exited() -> void:
	Gift_Desc.visible = false

func set_empty():
	gift_style.texture = empty_box
	child_name.text = ""
	gift_details.text = ""

func set_item(toys: Array) -> void:
	prints("[LOG] Toys in slot:", toys)
	gift_style.texture = textures.pick_random()
	child_name.text = Global.current_child
	gift_details.text = ", ".join(PackedStringArray(Global.wrapped_toys))
