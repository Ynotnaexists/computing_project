extends RigidBody2D

@export var ROTATION_SPEED: int = 10000

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("rotate_right"):
		apply_torque(ROTATION_SPEED)
	if Input.is_action_pressed("rotate_left"):
		apply_torque(-ROTATION_SPEED)
