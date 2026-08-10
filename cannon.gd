extends Area2D

@export var ROTATION_SPEED: int = 5
const CANNONBALL = preload("res://cannon_ball.tscn")

func _physics_process(delta: float) -> void:
	motion()
	shoot()

func shoot():
	if Input.is_action_just_pressed("shoot"):
		var c: Area2D = CANNONBALL.instantiate()
		get_tree().current_scene.add_child(c)
		c.global_position = global_position
		c.rotation = rotation


func motion():
	if Input.is_action_pressed("rotate_right"):
		rotate(deg_to_rad(ROTATION_SPEED))
	if Input.is_action_pressed("rotate_left"):
		rotate(deg_to_rad(-ROTATION_SPEED))
	
	set_rotation(clampf(rotation, -PI/2, PI/2))
