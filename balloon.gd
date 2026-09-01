extends Area2D
@export var speed: float = 7
@export var drag: float = 0.95
var velocity: Vector2 = Vector2(randf_range(-speed/4, speed/4), speed)
var game: Node2D

func _ready() -> void:
	game = get_tree().current_scene

func _process(delta) -> void:
	velocity *= pow(drag, delta)
	velocity.y -= 4 * delta
	position -= velocity

	var viewport_size = get_viewport_rect().size
	if position.x < 0:
		position.x = 0
		velocity.x = -velocity.x
	elif position.x > viewport_size.x:
		position.x = viewport_size.x
		velocity.x = -velocity.x

	if position.y > viewport_size.y + 10:
		queue_free()
		game.remove_lives(1)
		

func _on_area_entered(area):
	if area.is_in_group("cannonball"):
		queue_free()
		game.add_points(1)
