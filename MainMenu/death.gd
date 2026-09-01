extends Control

func setup(score: int):
	$Label.text = "You died :(\nYour score was: %d" % score


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://MainMenu/main_menu.tscn")

func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://Game/game.tscn")
