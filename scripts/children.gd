extends CanvasLayer

@onready var quota: Label = $textbox/MarginContainer/HBoxContainer/NoofChildren

func _ready() -> void:
	print(Global.nchildren)
	quota.text = str(Global.nchildren)

	
	
	
