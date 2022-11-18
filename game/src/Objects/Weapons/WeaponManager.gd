extends Node2D
class_name WeaponManager

# SIGNALS
signal player_fired_bullet(bullet, position, direction)

export (PackedScene) var Bullet
export (int) var bullet_spped = 100

var weapons: Array = []
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
	if event.is_action_released("shoot"):
		shoot()
		
		
func shoot():
	var bullet_instance = Bullet.instance()
	var direction = (weapon_direction.global_position - end_of_gun.global_position).normalized()
	
	emit_signal("player_fired_bullet", bullet_instance, end_of_gun.global_position, direction)


