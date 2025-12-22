extends CharacterBody2D

var speed: int = 235
var jump_power: int = -500
var gravity: int = 900
var x_direction: int = 0
var moving: bool = false

var increasing: bool = true

signal started_moving

func _ready():
	$cat_light.energy = 0
	
func _physics_process(delta):
	if not is_on_floor():
		$AnimatedSprite2D.play("jump")
		velocity += get_gravity() * delta
	elif is_on_floor() and moving:
		$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("still")
	
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
		
