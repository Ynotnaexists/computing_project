extends Area2D

@export var rotation_speed: int = 150
@export var cooldown_time: int = 10
@onready var marker: Sprite2D = $Marker
var pierce_points: Array
const CANNONBALL = preload("res://Game/Cannon/cannonball.tscn")


func _physics_process(delta: float) -> void:
	motion(delta)
	shoot(delta)
	
	queue_redraw()
		
func _draw() -> void:
	draw_line(global_position, (Vector2.UP*1000).rotated(rotation), Color.BLUE, 100)

var cooldown: int = 0
func shoot(delta: float):
	if cooldown != 0:
		cooldown -= 1 * delta
	if Input.is_action_just_pressed("shoot") and not cooldown:
		var c: Area2D = CANNONBALL.instantiate()
		get_tree().current_scene.add_child(c)
		c.setup(global_position, rotation)
		cooldown = cooldown_time
	


func motion(delta: float):
	if cooldown > cooldown_time * 0.75: return
	if Input.is_action_pressed("rotate_right"):
		rotate(deg_to_rad(rotation_speed) * delta)
	if Input.is_action_pressed("rotate_left"):
		rotate(deg_to_rad(-rotation_speed) * delta)
	
	set_rotation(clampf(rotation, -PI/2, PI/2))

func get_pierce_points(from: Vector2, to: Vector2) -> Array:
	var space_state = get_world_2d().direct_space_state
	var hit_points: Array = []
	var excluded: Array = [get_rid()]

	while true:
		var query = PhysicsRayQueryParameters2D.create(from, to)
		query.exclude = excluded
		query.collide_with_areas = true   # <- this was the missing piece
		query.collide_with_bodies = false # optional: skip physics bodies if balloons are purely Area2D
		var result = space_state.intersect_ray(query)
		if result.is_empty():
			break
		hit_points.append(result.position)
		excluded.append(result.collider.get_rid())
	return hit_points
