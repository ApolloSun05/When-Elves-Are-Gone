extends StaticBody2D

#@onready var panel = $ColorRect
@onready var Check = $Check_Wrapped_Toys
@onready var inside = $inside_box
@onready var box = $Sprite2D
var gift_spawn = preload("res://scenes/show_gift_scene.tscn")
signal wrapped(toy_name: String)

var spawnarea = Rect2(Vector2(-143, -391), Vector2(147, -104))
var gift_texture = {
	"Bear": preload("res://assets/bear.png"),
	"Doll": preload("res://assets/pixeldoll.jpg"),
	"Ball": preload("res://assets/pixelball.jpg")
}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inside.visible = false
	Global.drag_started.connect(_on_drag_started)
	Global.drag_ended.connect(_on_drag_ended)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

var child_name: String
var gifts_inserted = []

func _on_check_wrapped_toys_pressed() -> void:
	print("clicked")
	inside.visible = true
	box.visible = false
	

@onready var pic = $Sprite2D

func _on_drag_started() -> void:
	pic.texture = preload("uid://d0dmpae27i5lc")
	
func _on_drag_ended() -> void:
	pic.texture = preload("uid://8fogulmfu82m")
	
func show_gift():
	for toy in Global.wrapped_toys:
		var spawn = gift_spawn.instantiate()
		spawn.position =  Vector2(randf_range(spawnarea.x, spawnarea.x),randf_range(spawnarea.y, spawnarea.y))
		add_child(spawn)

func _on_exit_pressed() -> void:
	inside.visible = false
	box.visible = true
