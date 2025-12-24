extends Node2D
var increasing: bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = create_tween()
	tween.tween_property($black_screen, "modulate:a", 0, 2.0)
	await tween.finished
	$black_screen.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if increasing:
		$light.energy += 0.048
		if $light.energy >= 6:
			increasing = false
	else:
		$light.energy -= 0.048
		if $light.energy <= 0:
			increasing = true


func _on_restart_pressed():
	get_tree().change_scene_to_file("res://MAIN WORLD/main_map.tscn")
