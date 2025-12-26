extends Area2D

signal win_success

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body is CharacterBody2D:
		win_success.emit()
		call_deferred("ending_cutscene")
		

func ending_cutscene():
	Globals.total_points = get_parent().score
	print(Globals.total_points)
	DialogueManager.show_dialogue_balloon(load("res://MAIN WORLD/ending_cutscene.dialogue"), "start")
	#get_tree().change_scene_to_file("res://MAIN WORLD/win_screen.tscn")
