extends KinematicBody2D

var knockback = Vector2.ZERO
var velocity = Vector2.ZERO
var state = CHASE

export(int) var ACCELERATION = 300
export(int) var MAX_SPEED = 50
export(int) var FRICTION = 200

enum {
	IDLE,
	WANDER,
	CHASE
}

# Change to onready var sprite = $AnimatedSprite
onready var sprite = $Sprite
onready var stats = $Stats
onready var playerDetectionZone = $PlayerDetectionZone

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
	knockback = move_and_slide(knockback)
	
	match state:
		IDLE:
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
			seek_player()
			
		WANDER:
			pass
			
		CHASE:
			var player = playerDetectionZone.player
			velocity = move_and_slide(velocity)
			
			if player != null:
				var direction = (player.global_position - global_position).normalized()
				# Moving towards Vector2.RIGHT because the character controller isn't completed
				velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
			else:
				state = IDLE
				
			sprite.flip_h = velocity.x < 0
			
func seek_player():
	if playerDetectionZone.can_see_player():
		state = CHASE;

func _on_Hurtbox_area_entered(area):
	# Need to import bullet damage
	stats.health -= area.damage

	# Used to knockback the zombie in the apporpiate direction
	# knockback = area.knockback_vector * 120
	knockback = Vector2.RIGHT * 20

func _on_Stats_no_health():
	queue_free()
