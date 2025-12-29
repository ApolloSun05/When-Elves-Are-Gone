extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	modulate = Color(Color.HOT_PINK, 0.5)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.is_dragging:
		visible = true
	else:
		visible = false
