extends "res://src/Objects/Weapons/Weapon.gd"

onready var attack_cooldown: Timer = $AttackCooldown
onready var animation_player: AnimationPlayer = $AnimationPlayer

func start_cooldown():
	attack_cooldown.start()
	
func can_shoot() -> bool:
	return attack_cooldown.is_stopped()
	
func play_animation():
	animation_player.play("muzzle_flash")
