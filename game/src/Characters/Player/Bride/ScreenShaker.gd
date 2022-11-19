extends Node

export (int) var time = 0
onready var camera = get_parent()

func _ready():
	pass 
	
	
func _shake(duration := 0.8, magnitude := 8):
	print("Should shake")
	while time < duration:
		time += get_process_delta_time()
		time = min(time, duration)
		
		var offset = Vector2()
		
		offset.x = rand_range(-magnitude, magnitude)
		offset.y = rand_range(-magnitude, magnitude)
		
		camera.set_offset(offset)
		
		yield(get_tree(), "idle_frame")
		
	time = 0
	camera.set_offset(Vector2.ZERO)
