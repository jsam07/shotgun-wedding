extends Node2D

var enemies: Array = []


func _ready():
	
	enemies.append(load("src/Enemies/Zombie.tscn"))
	enemies.append(load("src/Enemies/FlowerGirl.tscn"))
	spawn_random_enemies()
	
	
func spawn_random_enemies() -> void:
	var rand = RandomNumberGenerator.new()
	var screen_size = get_viewport().get_visible_rect().size
	
	for enemy_scene in enemies:
		for i in range(0, 10):
			var enemy = enemy_scene.instance()

			enemy.position.x = get_random_coord(rand, screen_size.x)
			enemy.position.y = get_random_coord(rand, screen_size.y)
			
			add_child(enemy)


func get_random_coord(rand: RandomNumberGenerator, maxVal: float) -> float:
	rand.randomize()
	return rand.randf_range(0, maxVal)


