extends Node2D
class_name Bullet

export (int) var speed = 10

var direction := Vector2.ZERO
onready var kill_timer = $KillTimer

func _ready():
	kill_timer.start()

func _physics_process(delta: float) -> void:
	if direction != Vector2.ZERO:
		var velocity = direction * speed
		global_position += velocity
		

func set_direction(direction: Vector2) -> void:
	self.direction = direction
	rotation += direction.angle()


func _on_KillTimer_timeout():
	queue_free()
