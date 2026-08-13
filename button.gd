extends Button

var tween

func _ready():
	pivot_offset = size / 2
	mouse_entered.connect(make_bigger)
	mouse_exited.connect(make_smaller)

func make_bigger():
	if tween:
		tween.kill()
	tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.1, 1.1), 0.2)

func make_smaller():
	if tween:
		tween.kill()
	tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1, 1), 0.2)
