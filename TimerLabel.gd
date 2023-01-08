extends Label

func _ready():
	get_tree().paused = true
	yield(get_tree().create_timer(2), "timeout")
	MusicController.playSFX(MusicController.COUNTDOWN)
	for n in range(3, 0, -1):
		set_text(str(n))
		yield(get_tree().create_timer(1), "timeout")
	hide()
	get_tree().paused = false
