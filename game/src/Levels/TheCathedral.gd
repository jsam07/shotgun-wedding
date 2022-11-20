extends Node2D
class_name TheCathedral

onready var bullet_manager = $BulletManager
onready var weapon_manager = $Bride/WeaponManager


func _ready() -> void:
	weapon_manager.connect("player_fired_bullet", bullet_manager, "handle_bullet_spawned")
