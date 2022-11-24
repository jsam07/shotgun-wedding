extends Node2D
class_name WeaponManager


var weapons: Array = []
onready var current_weapon: Weapon = $Shotgun


func _ready() -> void:
	weapons = get_children()
	
	
func connect_weapons(bullet_manager: BulletManager) -> void:
	for weapon in weapons:
		weapon.connect("player_fired_bullet", bullet_manager, "handle_bullet_spawned")

func initialize() -> void:
	
	for weapon in weapons:
		weapon.initialize()
	
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		current_weapon.shoot()
		
	elif event.is_action_pressed("reload"):
		current_weapon.reload()
		
	

	
		
		
		


