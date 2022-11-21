extends Node2D
class_name TheCathedral

onready var bullet_manager: BulletManager = $BulletManager
onready var player_manager: PlayerManager = $PlayerManager


func _ready() -> void:
	player_manager.initialize(bullet_manager)
	
