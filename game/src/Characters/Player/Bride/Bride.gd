class_name Bride
extends KinematicBody2D


# CONSTANTS
export (int) var FRICTION = 500
export (int) var MAX_SPEED = 150
export (int) var ACCELERATION = 500

# SIGNALS
signal died
signal player_health_changed(new_health)

onready var health_stat = $Health
onready var velocity = Vector2.ZERO
onready var weapon_manager = $WeaponManager
onready var screen_shaker = $Camera/ScreenShaker


func _ready():
	weapon_manager.initialize()
	

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector = input_vector.normalized()
	
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = move_and_slide(velocity)
	
	
	
