extends KinematicBody2D

export var move_speed: int = 100
var velocity: Vector2

func _process(_delta):
	directionalMovement()
	

# incredibly basic movement controller to give us a start
func directionalMovement ():
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"), 
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	velocity = input_direction * move_speed
	print(velocity)

	velocity = move_and_slide(velocity)
