class_name Drag
extends Node

var draggable: bool = false
var is_dragged: bool = false

var offset: Vector2
var initial_pos: Vector2

func _process(_delta: float) -> void:
	if self.draggable:
		if Input.is_action_just_pressed("click"):
			print("clicked")
			#get_parent().z_index += 100
			is_dragged= true
			Global.is_dragging = true
			#get_parent().freeze = true
		if Input.is_action_pressed("click"):
			get_parent().global_position = get_parent().get_global_mouse_position()
		elif Input.is_action_just_released("click"):
			#get_parent().z_index -= 100
			print("released")
			is_dragged= false
			Global.is_dragging = false
			# get_parent().linear_velocity = Vector2.ZERO
			#get_parent().freeze = false
			#var impulse = (get_parent().get_global_mouse_position() - get_parent().global_transform.origin) * 5
			#get_parent().apply_central_impulse(impulse)
			#print("applied impulse")

func _exit_tree() -> void:
	if self.is_dragged:
		Global.is_dragging = false
