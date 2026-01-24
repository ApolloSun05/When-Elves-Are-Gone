extends Control

@onready var Gift_Desc = $Gift_Desc
@onready var child_name = $MarginContainer/MarginContainer/Child_Name
@onready var gift_details: Label = $"Gift_Desc/Margin/Gift Details"
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
	gift_details.text = ""

func set_item(toys: Array, kid: String) -> void:
	prints("[LOG] Toys in slot:", toys)
	child_name.text = kid
	gift_details.text = ", ".join(PackedStringArray(Global.wrapped_toys))

func _on_button_pressed() -> void:
	if get_parent().get_parent().get_parent().get_parent().name == "delivery":
		print("tite")
		Global.deliver(child_name.text)
	pass # Replace with function body.
