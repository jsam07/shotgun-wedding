extends "res://src/Objects/Weapons/Weapon.gd"
class_name Shotgun


onready var attack_cooldown: Timer = $AttackCooldown
onready var animation_player: AnimationPlayer = $AnimationPlayer
onready var Bullet = preload("res://src/Objects/Projectiles/Bullet.tscn")


func shoot() -> void:
	if can_shoot() and not reloading:
		var direction: Vector2 = (weapon_direction.global_position - end_of_gun.global_position).normalized()
		
		var direction_top = direction.rotated(deg2rad(-5))
		var direction_bottom = direction.rotated(deg2rad(5))
		
#		get_parent().screen_shaker._shake(0.2, 2)
		
		emit_signal("player_fired_bullet", Bullet.instance(), end_of_gun.global_position, direction_top)
		emit_signal("player_fired_bullet", Bullet.instance(), end_of_gun.global_position, direction)
		emit_signal("player_fired_bullet", Bullet.instance(), end_of_gun.global_position, direction_bottom)
		
		play_fire_sound()
		play_animation()
		start_cooldown()
		
		
func reload() -> void:
	play_reload_sound()
		
		
func play_fire_sound() -> void:
	SoundPlayer.play_sound(SoundPlayer.SHOTGUN_FIRE)
	
	
func play_reload_sound() -> void:
	SoundPlayer.play_sound(SoundPlayer.SHOTGUN_RELOAD)

func start_cooldown():
	attack_cooldown.start()
	
func can_shoot() -> bool:
	return attack_cooldown.is_stopped()
	
func play_animation():
	animation_player.play("muzzle_flash")
