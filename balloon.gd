extends Area2D

@export var speed := 100.0

func _process(delta):
	position.y += speed * delta
	
	if position.y > get_viewport_rect().size.y + 100:
		queue_free()

func _on_area_entered(area):
	if area.is_in_group("cannonballs"):
		area.queue_free()
		queue_free()
		
