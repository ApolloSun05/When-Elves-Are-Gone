class_name Gift
extends Node2D

signal wrapped(toy_name: String)

@onready var drag: Drag = $Drag

@export var toy_name = ""
@export var toy_texture: Texture2D
@onready var icon_sprite = $Sprite2D
@onready var orig_position = position

var draggable = false
var is_inside_giftbox = false
var body_ref = []
var offset: Vector2
var initialPos: Vector2

func _ready() -> void:
	drag.released.connect(_drag_released)
	if not Engine.is_editor_hint():
		icon_sprite.texture = toy_texture
	
func _process(_delta: float) -> void:
	if Engine.is_editor_hint():
		icon_sprite.texture = toy_texture
	pass
	#if draggable:
		#if Input.is_action_just_pressed("click"):
			#initialPos = global_position
			#offset = get_global_mouse_position() - global_position
			#Global.is_dragging = true
		#if Input.is_action_pressed("click"):
			#global_position = get_global_mouse_position()
		#elif Input.is_action_just_released("click"):
			#Global.is_dragging = false
			#var tween = get_tree().create_tween()
			#if is_inside_giftbox:
				#tween.tween_property(self, "position", body_ref.position, 0.2).set_ease(Tween.EASE_OUT)
			#else:
				#tween.tween_property(self, "global_position", initialPos, 0.2).set_ease(Tween.EASE_OUT)
	
func _on_area_2d_mouse_shape_entered(_shape_idx: int) -> void:
	if not Global.is_dragging:
		#print("can drag")
		drag.draggable = true
		scale = Vector2(1.05, 1.05)

func _on_area_2d_mouse_shape_exited(_shape_idx: int) -> void:
	if not Global.is_dragging:
		#print("cant drag")
		drag.draggable = false
		scale = Vector2(1, 1)

func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body)
	if body.is_in_group("dropable"):
		print("im here")
		is_inside_giftbox = true
		#print(body.toy_name)

func _on_area_2d_body_exited(body: Node2D) -> void:
	if not body.is_in_group("dropable"):
		is_inside_giftbox = false
		body_ref = body

func _drag_released():
	if is_inside_giftbox:
		wrapped.emit(self.toy_name)
		Global.wrapped_toys.append(toy_name)
		Global.inventory[Global.current_child] = Global.wrapped_toys
		prints("[LOG] Inventory updated:", Global.inventory)
		Global.inventory_updated.emit()
		prints(toy_name, "has been put in the gift box")
		position = orig_position
