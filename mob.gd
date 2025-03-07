extends CharacterBody3D

@export var min_speed = 10

@export var max_speed = 20

func _physics_process(delta: float) -> void:
	move_and_slide()
