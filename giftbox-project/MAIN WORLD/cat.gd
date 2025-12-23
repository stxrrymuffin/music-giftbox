extends CharacterBody2D

var speed: int = 235
var jump_power: int = -500
var gravity: int = 900
var x_direction: int = 0
var moving: bool = false

var increasing: bool = true
var attacking: bool = false

signal started_moving

func _ready():
	$cat_light.energy = 0
	
func _physics_process(delta):
	if not is_on_floor():
		if not attacking:
			$AnimatedSprite2D.play("jump")
		velocity += get_gravity() * delta
	elif is_on_floor() and moving and not attacking:
		$AnimatedSprite2D.play("run")
	elif not attacking:
		$AnimatedSprite2D.play("still")
	
	if Input.is_action_just_pressed("attack"):
		var bodies: Array = $detect_enemy.get_overlapping_bodies()
		for body in bodies:
			if body is CharacterBody2D:
				body.queue_free()
		attacking = true
		$AnimatedSprite2D.play("attack")
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y += jump_power
		
	if Input.is_action_pressed("ui_right") and not Globals.in_cutscene:
		x_direction = 1
		if moving == false:
			started_moving.emit()
		moving = true
	velocity.x = x_direction * speed
	move_and_slide()
	if moving:
		flash_light()

func flash_light():
	if increasing:
		$cat_light.energy += 0.01
		if $cat_light.energy >= 1.1:
			increasing = false
	else:
		$cat_light.energy -= 0.008
		if $cat_light.energy <= 0:
			increasing = true
		


func _on_animated_sprite_2d_animation_finished():
	if $AnimatedSprite2D.animation == "attack":
		attacking = false


func _on_char_body_body_entered(body):
	if body is CharacterBody2D and body.name != "cat":
		$CollisionShape2D.set_deferred("disabled", true)
