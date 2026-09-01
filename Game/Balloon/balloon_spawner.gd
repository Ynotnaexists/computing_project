extends Node2D

@export var balloon_scene: PackedScene
@export var spawn_time: int = 1
@onready var TIMER: Timer = $Timer

func _ready() -> void:
	TIMER.wait_time = spawn_time
	TIMER.timeout.connect(spawn_balloon)
	TIMER.start()

func spawn_balloon() -> void:
	var balloon: Area2D = balloon_scene.instantiate()
	var screen_size: Vector2 = get_viewport_rect().size
	
	balloon.position = Vector2(
		randf_range(0, screen_size.x),
		screen_size.y
	)
	
	get_parent().add_child(balloon)
