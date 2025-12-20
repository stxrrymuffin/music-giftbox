extends Node2D
#alled when the node enters the scene tree for the first time.
func _ready():
	var player = $cat
	player.started_moving.connect(_play_audio)
	DialogueManager.show_dialogue_balloon(load("res://MAIN WORLD/starting_cutscene.dialogue"), "start")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _play_audio():
	$AudioStreamPlayer2D.play(0)
	return
