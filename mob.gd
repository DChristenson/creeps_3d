extends CharacterBody3D

@export var min_speed = 10
@export var max_speed = 20
signal squashed

func _physics_process(delta: float) -> void:
	move_and_slide()

func initialize(start_position, player_position):
	look_at_from_position(start_position, player_position, Vector3.UP)
	rotate_y(randf_range(-PI / 4, PI / 4))
	var random_speed = randi_range(min_speed, max_speed)
	velocity = Vector3.FORWARD * random_speed
	velocity = velocity.rotated(Vector3.UP, rotation.y)

func _on_visibility_notifier_screen_exited() -> void:
	queue_free()

func squash():
		squashed.emit()
		queue_free()
