extends Area2D

@export var speed: float = 10
@export var drag: float = 0.95

var velocity: Vector2 = Vector2(randf_range(-speed/4, speed/4), speed)

func _process(delta) -> void: 
	velocity *= pow(drag, delta)
	velocity.y -= 6 * delta
	position -= velocity
	
	print("position: ", position)
	print("velocity: ", velocity)
	
	if position.y > get_viewport_rect().size.y + 1000:
		queue_free()

func _on_area_entered(area):
	if area.is_in_group("cannonball"):
		area.queue_free()
		queue_free()
		
