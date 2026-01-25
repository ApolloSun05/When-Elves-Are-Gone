extends StaticBody2D

signal wrapped(toy_name: String)

#@onready var panel = $ColorRect
@onready var Check = $Check_Wrapped_Toys
@onready var inside = $inside_box
@onready var box = $Sprite2D
@onready var finishbutton = $MarginContainer
@onready var control: Control = $Control
var spawned_objs: Array[Sprite2D] = []
var gift_spawn = preload("res://scenes/show_gift_scene.tscn")

var spawnarea = Rect2(Vector2(-120, -370), Vector2(111, -137))
var gift_texture = {
	"Bear": preload("res://assets/bear (1).png"),
	"Baseball": preload("res://assets/baseball.png"),
	"Crayons": preload("res://assets/crayons.png"),
	"Basketball": preload("res://assets/basketball (1).png"),
	"Dice": preload("res://assets/dice (1).png"),
	"Robot": preload("res://assets/robot.png"),
	"Coal": preload("res://assets/coal.png"),
	"Doll": preload("res://assets/claus plushie.png"),
	"Dino": preload("res://assets/dino ver 4.png")
}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inside.visible = false
	finishbutton.visible = false
	Global.drag_started.connect(_on_drag_started)
	Global.drag_ended.connect(_on_drag_ended)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

var child_name: String
var gifts_inserted = []

func _on_check_wrapped_toys_pressed() -> void:
	control.visible = true
	inside.visible = true
	finishbutton.visible = true
	box.visible = false
	show_gift()
	

@onready var pic = $Sprite2D

func _on_drag_started() -> void:
	pic.texture = preload("res://assets/gift wrapper (open with box).png")
	
func _on_drag_ended() -> void:
	pic.texture = preload("res://assets/gift wrapper (gray).png")
	
func show_gift():
	for toy in Global.wrapped_toys:
		var spawn = gift_spawn.instantiate()
		spawn.position =  Vector2(randf_range(spawnarea.position.x, spawnarea.position.x + spawnarea.size.x),randf_range(spawnarea.position.y, spawnarea.position.y + spawnarea.size.y))
		print(spawn.position)
		spawn.scale = Vector2(0.09, 0.09)
		spawn.texture = gift_texture[toy]
		spawned_objs.append(spawn)
		add_child(spawn)

func kill_child():
	for child in spawned_objs:
		child.queue_free()
	spawned_objs = []

func _on_exit_pressed() -> void:
	kill_child()
	finishbutton.visible = false
	inside.visible = false
	box.visible = true
	control.visible = false

func _on_finish_wish_pressed() -> void:
	Global.inventory[Global.current_child] = Global.wrapped_toys.duplicate_deep()
	kill_child()
	Global.current_child = ""
	Global.current_toys.clear()
	Global.wrapped_toys.clear()
	Global.inventory_updated.emit()
	finishbutton.visible = false
	inside.visible = false
	box.visible = true
	control.visible = false
	print("HELLYEAHH")
