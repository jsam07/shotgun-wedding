extends Node

const SHOTGUN_FIRE = preload("res://assets/sounds/weapons/shotgun/shotgun_fire.mp3")
const SHOTGUN_RELOAD = preload("res://assets/sounds/weapons/shotgun/shotgun_reload.mp3")


onready var audio_players := $AudioPlayers

func play_sound(sound: Resource) -> void:
	for audio_player in audio_players.get_children():
		if not audio_player.playing:
			
			audio_player.stream = sound
			audio_player.play()
			break
