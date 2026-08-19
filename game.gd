extends Node

@onready var score_label: Label = $CanvasLayer/ScoreLabel

var score: int = 0

func _ready() -> void:
	update_score_ui()

func add_points(points: int) -> void:
	score += points
	update_score_ui()

func reset_score() -> void:
	score = 0
	update_score_ui()

func update_score_ui() -> void:
	score_label.text = "Score: %d" % score
