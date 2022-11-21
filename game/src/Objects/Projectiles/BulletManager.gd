extends Node2D
class_name BulletManager

func handle_bullet_spawned(bullet: Bullet, position, direction):
	add_child(bullet)
	
	bullet.global_position = position
	bullet.set_direction(direction)
