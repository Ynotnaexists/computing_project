extends Node2D

@export var balloon_scene: PackedScene
@export var spawn_time := 5.0

func _ready():
	$Timer.wait_time = spawn_time
	$Timer.timeout.connect(spawn_balloon)
	$Timer.start()

func spawn_balloon():
	var balloon = balloon_scene.instantiate()
	
	var screen_width = get_viewport_rect().size.x
	
	# Random X position across the top
	balloon.position = Vector2(
		randf_range(0, screen_width),
		-50
	)
	
	get_parent().add_child(balloon)
