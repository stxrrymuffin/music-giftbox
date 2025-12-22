extends Node2D
#alled when the node enters the scene tree for the first time.
func _ready():
	var player = $cat
	player.started_moving.connect(_play_audio)
	DialogueManager.show_dialogue_balloon(load("res://MAIN WORLD/starting_cutscene.dialogue"), "start")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $cat.position.y > 700:
		#$Parallax2D.visible = false
		#$Parallax2D3.visible = false
		#$Parallax2D4.visible = false
		var darkness_tween = create_tween()
		darkness_tween.tween_property($ParallaxBackground/CanvasModulate2, "color", Color.BLACK, 3)
		var camera_tween = create_tween().set_ease(Tween.EASE_IN_OUT)
		camera_tween.tween_property($cat/Camera2D, "zoom", Vector2(2,2),3)

func _play_audio():
	$AudioStreamPlayer2D.play(0)
	return
