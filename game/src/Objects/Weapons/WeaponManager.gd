extends Node2D
class_name WeaponManager

# SIGNALS
signal player_fired_bullet(bullet, position, direction)

export (PackedScene) var Bullet

var weapons: Array = []
onready var attack_cooldown: Timer

# TODO: Refactor this instatiate inside _ready
onready var end_of_gun = $Shotgun/EndOfWeapon
onready var current_weapon: Weapon = $Shotgun
onready var weapon_direction = $Shotgun/WeaponDirection



func _ready() -> void:
	weapons = get_children()

func initialize() -> void:
	
	for weapon in weapons:
		weapon.initialize()

func reload() -> void:
	current_weapon.start_reload()
	
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		shoot()
		
		
func shoot():
	
	if current_weapon.can_shoot():
		
		var bullet_instance = Bullet.instance()
		var direction = (weapon_direction.global_position - end_of_gun.global_position).normalized()
		
		#	get_parent().screen_shaker._shake(0.2, 2)
		emit_signal("player_fired_bullet", bullet_instance, end_of_gun.global_position, direction)
		
		current_weapon.play_animation()
		current_weapon.start_cooldown()
		
		


