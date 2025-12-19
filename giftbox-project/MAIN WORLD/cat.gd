extends CharacterBody2D

var speed: int = 250
var jump_power: int = -500
var gravity: int = 900
var x_direction: int = 0

func _ready():
	pass
	
func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y += jump_power
	
	elif Input.is_action_pressed("ui_right"):
		x_direction = 1
	velocity.x = x_direction * speed
	
	move_and_slide()
