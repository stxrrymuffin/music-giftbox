extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("default")
	$AnimatedSprite2D2.play("default")
	var tween = create_tween()
	tween.tween_property($black_screen, "modulate:a", 0, 2.0)
	await tween.finished
	$black_screen.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_animated_sprite_2d_2_frame_changed():
	var tween = create_tween()
	tween.tween_property($AnimatedSprite2D2, "position", $AnimatedSprite2D2.position + Vector2(0, -20), 0.15)
	tween.chain().tween_property($AnimatedSprite2D2, "position", $AnimatedSprite2D2.position, 0.15)
	tween.tween_property($TextureRect3, "position", $TextureRect3.position + Vector2(0, -20), 0.15)
	tween.chain().tween_property($TextureRect3, "position", $TextureRect3.position, 0.15)
