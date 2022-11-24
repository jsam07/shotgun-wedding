extends Node2D
class_name Weapon

# SIGNALS
signal player_fired_bullet(bullet, position, direction)

var reloading = false
onready var end_of_gun: Position2D
onready var weapon_direction: Position2D

func _ready():
	end_of_gun = get_node("EndOfWeapon")
	weapon_direction = get_node("WeaponDirection")
	
func initialize() -> void:
	pass
	
func start_reload():
	pass
	
	
func _stop_reload():
	pass
	
	
func set_current_ammo(new_ammo: int):
	pass
	
func _physics_process(delta):
	look_at(get_global_mouse_position())
	
	
	

