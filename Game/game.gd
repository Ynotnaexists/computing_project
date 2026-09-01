extends Node

@onready var score_label: Label = $Counters/ScoreLabel
@onready var life_label: Label = $Counters/LifeLabel

var score: int = 0
var lives: int = 5

func _ready() -> void:
	update_ui()

func add_points(points: int) -> void:
	score += points
	update_ui()

func remove_lives(damage: int) -> void:
	lives -= damage
	if lives < 1: die()
	update_ui()
	

func reset_score() -> void:
	score = 0
	update_ui()

func update_ui() -> void:
	score_label.text = "Score: %d" % score
	life_label.text = "Lives: %d" % lives
	
func die() -> void:
	var scene = preload("res://MainMenu/death.tscn")
	var instance = scene.instantiate()

	instance.setup(score)

	get_tree().current_scene.queue_free()
	get_tree().root.add_child(instance)
	get_tree().current_scene = instance
