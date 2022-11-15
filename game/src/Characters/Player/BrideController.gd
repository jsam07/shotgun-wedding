extends KinematicBody2D

export var move_speed: int = 100
var velocity: Vector2

# bullet
var bullet = preload('res://src/Objects/Projectiles/Bullet.tscn')
var bullet_speed = 1500

func _process(_delta):
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
		var bullet_instance = bullet.instance()
		bullet_instance.position = global_position
	
		get_parent().add_child(bullet_instance)
