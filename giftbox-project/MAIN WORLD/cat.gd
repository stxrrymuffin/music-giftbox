extends CharacterBody2D

var speed: int = 250
var jump_power: int = -500
var gravity: int = 900
var x_direction: int = 0
var moving: bool = false

signal started_moving

func _ready():
	pass
	
func _physics_process(delta):
	if not is_on_floor():
		$AnimatedSprite2D.play("jump")
		velocity += get_gravity() * delta
	elif is_on_floor() and not Globals.in_cutscene:
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
