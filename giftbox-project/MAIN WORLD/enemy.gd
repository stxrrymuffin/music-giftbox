extends CharacterBody2D



func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta

	move_and_slide()

func dead_animation():
	$CollisionShape2D.disabled = true
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "rotation_degrees", 1080, 0.5)
	tween.tween_property(self, "position", position + Vector2(700, -700), 0.5)
	tween.tween_property(self, "scale", Vector2(3,3), 1)
	tween.EASE_OUT
	await get_tree().create_timer(1.0).timeout
	z_index = 100
