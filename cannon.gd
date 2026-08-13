extends Area2D

@export var rotation_speed: int = 150
@export var cooldown_time: int = 50
const CANNONBALL = preload("res://cannonball.tscn")

func _physics_process(delta: float) -> void:
	motion(delta)
	shoot(delta)

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
