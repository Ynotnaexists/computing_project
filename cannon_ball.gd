extends Area2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	position = rotation * Vector2.RIGHT * 600 * delta
