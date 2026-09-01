extends Area2D
@export var speed: float = 5
@export var drag: float = 0.95
var velocity: Vector2 = Vector2(randf_range(-speed/4, speed/4), speed)

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

	print("position: ", position)
	print("velocity: ", velocity)

	if position.y > viewport_size.y + 1000:
		queue_free()

func _on_area_entered(area):
	if area.is_in_group("cannonball"):
		area.queue_free()
		queue_free()
<<<<<<< Updated upstream
		var game := get_tree().root.get_node("YourMainScene/Game")
		game.add_points(1)
=======
>>>>>>> Stashed changes
