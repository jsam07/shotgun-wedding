extends Node2D

var bulletSpeed = 800
var movement = Vector2()
var mouse_pos = null
var angle = 0

func _ready():
	mouse_pos = get_local_mouse_position()
	angle = get_angle_to(get_global_mouse_position())

func _physics_process(delta):
	movement = movement.move_toward(mouse_pos, delta)
	movement = movement.normalized()
	
	position = position + (movement * bulletSpeed * delta)
	rotation = angle
