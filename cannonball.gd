extends Area2D

@export var speed: int = 2000

func setup(p: Vector2, r: float):
	global_position = p
	rotation = r
	z_index = -1

func _process(delta: float) -> void:
	position += Vector2.UP.rotated(rotation) * speed * delta
	speed *= 0.99
	
	var screen = get_viewport_rect()
	if not screen.has_point(global_position):
		queue_free()
