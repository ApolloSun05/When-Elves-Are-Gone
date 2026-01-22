extends StaticBody2D

#@onready var panel = $ColorRect
@onready var Check = $Check_Wrapped_Toys
signal wrapped(toy_name: String)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.drag_started.connect(_on_drag_started)
	Global.drag_ended.connect(_on_drag_ended)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

var child_name: String
var gifts_inserted = []

func _on_check_wrapped_toys_pressed() -> void:
	print("clicked")
@onready var pic = $Sprite2D	
func _on_drag_started() -> void:
	pic.texture = preload("uid://d0dmpae27i5lc")
	

func _on_drag_ended() -> void:
	pic.texture = preload("uid://8fogulmfu82m")
