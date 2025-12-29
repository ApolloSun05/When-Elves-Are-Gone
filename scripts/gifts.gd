extends Node2D

var draggable = false
var is_inside_giftbox = false
var body_ref
var offset: Vector2
var initialPos: Vector2

func _process(delta: float) -> void:
	if draggable:
		if Input.is_action_just_pressed("click"):
			initialPos = global_position
			offset = get_global_mouse_position() - global_position
			Global.is_dragging = true
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position()
		elif Input.is_action_just_released("click"):
			Global.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_giftbox:
				tween.tween_property(self, "position", body_ref.position, 0.2).set_ease(Tween.EASE_OUT)
			else:
				tween.tween_property(self, "global_position", initialPos, 0.2).set_ease(Tween.EASE_OUT)
	
func _on_area_2d_mouse_shape_entered(shape_idx: int) -> void:
	if not Global.is_dragging:
		draggable = true
		scale = Vector2(1.05, 1.05)

func _on_area_2d_mouse_shape_exited(shape_idx: int) -> void:
	if not Global.is_dragging:
		draggable = false
		scale = Vector2(1, 1)

func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group('droppable'):
		is_inside_giftbox = true
		body.modulate = Color(Color.AQUA, 1)
		body_ref = body

func _on_area_2d_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group('droppable'):
		is_inside_giftbox = false
		body.modulate = Color(Color.HOT_PINK, 0.7)
		body_ref = body

# HELP AGAIN!! I found a better yt kasi na may drop area and draggable item, the dragging dont ork
