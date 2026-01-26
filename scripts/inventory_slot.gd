extends Control

@onready var Gift_Desc = $Gift_Desc
@onready var child_name = $MarginContainer/MarginContainer/Child_Name
@onready var gift_details: Label = $"Gift_Desc/Margin/Gift Details"
@onready var gift_style = $MarginContainer/Sprite2D
@onready var empty_box = preload("res://assets/gift wrapper (open with box).png")
@onready var textures = [preload("res://assets/gift wrapper (blue).png"), 
	preload("res://assets/gift wrapper (green).png"),
	preload("res://assets/gift wrapper (purple).png"),
	preload("res://assets/gift wrapper (red).png")
]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Gift_Desc.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_mouse_entered() -> void:
	Gift_Desc.visible = true
	
func _on_button_mouse_exited() -> void:
	Gift_Desc.visible = false

func set_empty():
	gift_style.texture = empty_box
	child_name.text = ""
	gift_details.text = ""

func set_item(toys: Array, kid: String) -> void:
	prints("[LOG] Toys in slot:", ", ".join(PackedStringArray(toys)))
	child_name.text = kid	
	gift_style.texture = textures.pick_random()
	gift_details.text = "> " + "\n> ".join(toys)
	prints("[LOG] Details Text:", gift_details.text)

func _on_button_pressed() -> void:
	if get_parent().get_parent().get_parent().get_parent().name == "delivery":
		print("tite")
		Global.deliver(child_name.text)
	pass # Replace with function body.
