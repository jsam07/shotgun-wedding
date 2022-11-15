extends KinematicBody2D

export var move_speed: int = 100
var velocity: Vector2

# weapon
var bullet = preload('res://src/Objects/Projectiles/Bullet.tscn')
var bullet_speed = 1500
var time_since_last_shot = 1 # should start incrementing at fire_rate
var fire_rate = 1 # bullets per second

func _process(delta):
	time_since_last_shot += delta
	directionalMovement()
	fireWeapon()
	

# incredibly basic movement controller to give us a start
func directionalMovement ():
	var input_vector = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"), 
		Input.get_action_strength("down") - Input.get_action_strength("up")
	).normalized()
	
	velocity = input_vector * move_speed

	velocity = move_and_slide(velocity)

func fireWeapon():
	if Input.get_action_strength("weapon_fire"):
		if time_since_last_shot > fire_rate:
			time_since_last_shot = 0
			var bullet_instance = bullet.instance()
			bullet_instance.position = global_position
			
			get_parent().add_child(bullet_instance)
			
