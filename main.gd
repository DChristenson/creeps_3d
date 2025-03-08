extends Node

@export var mob_scene: PackedScene

func _on_mob_timer_timeout() -> void:
	var mob = mob_scene.instantiate()
	
	var mob_spawn_loc = get_node("SpawnPath/SpawnLocation")
	
	mob_spawn_loc.progress_ratio = randf()
	
	var player_position = $Player.position
	
	mob.initialize(mob_spawn_loc.position, player_position)
	
	add_child(mob)
	mob.squashed.connect($UserInterface/ScoreLabel._on_mob_squashed.bind())

func _on_player_hit() -> void:
	$MobTimer.stop()
	$UserInterface/Retry.show()
	

func _ready():
	$UserInterface/Retry.hide()
