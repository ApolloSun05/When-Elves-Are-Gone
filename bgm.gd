extends AudioStreamPlayer2D

@onready var bgm = preload("res://assets/sounds/120bgm.mp3")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bgm.loop = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _play_music(music: AudioStream, volume = 0.0):
	if stream ==music:
		return
	stream = music
	volume_db = volume
	play()
	
func play_music_level():
	_play_music(bgm)
