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
		get_tree().change_scene_to_file("res://MAIN WORLD/win_screen.tscn")
