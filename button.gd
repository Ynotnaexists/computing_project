extends Button

@export var balloon_scene: PackedScene
@export var spawn_time: float = 1.0
@export var top_y: float = -50.0

@onready var timer: Timer = $Timer

func _ready() -> void:
	if balloon_scene == null:
		push_error("balloon_scene is not assigned.")
		return

	randomize()

	timer.wait_time = spawn_time
	timer.timeout.connect(spawn_balloon) 
	timer.one_shot = false
	timer.start()

func spawn_balloon() -> void:
	if balloon_scene == null:
		return

	var balloon := balloon_scene.instantiate()

	var viewport_size := get_viewport_rect().size
	var screen_width := viewport_size.x

	
	var x := randf_range(0.0, screen_width)
	balloon.position = Vector2(x, top_y)
	
	get_tree().current_scene.add_child(balloon)
