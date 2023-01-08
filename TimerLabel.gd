extends Label

func _ready():
	get_tree().paused = true
	MusicController.stop_music()
	if LevelController.levelIndex > 0:
		yield(get_tree().create_timer(2), "timeout")
	MusicController.playSFX(MusicController.COUNTDOWN)
	for n in range(3, 0, -1):
		set_text(str(n))
		yield(get_tree().create_timer(1), "timeout")
	hide()
	get_tree().paused = false

	# Play next song
	if LevelController.levelIndex % 2 == 0:
		MusicController.play_track1()
	else:
		MusicController.play_track2()
