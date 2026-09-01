extends AudioStreamPlayer

func _ready() -> void:
	if stream == null:
		push_error("No music file is assigned to the AudioStreamPlayer.")
		return

	volume_db = -10.0
	play()

	if playing:
		print("Music started successfully.")
	else:
		push_error("Music failed to start.")
