extends Node2D
class_name PlayerManager

const START = 48

onready var player: Bride
onready var weapon_manager: WeaponManager
onready var bride_scene = load("src/Characters/Player/Bride/Bride.tscn")


func initialize(bullet_manager: BulletManager):
	spawn_player(START, START)
	weapon_manager = player.get_child(5)
	connect_weapon_manager(bullet_manager)
	
func connect_weapon_manager(bullet_manager: BulletManager):
	weapon_manager.connect_weapons(bullet_manager)
	
	
func spawn_player(x: float, y: float) -> void:
	
	player = bride_scene.instance()
	player.position.x = x
	player.position.y = y
	
	add_child(player)
