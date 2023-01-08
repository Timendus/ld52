extends Node
export(Array, PackedScene) var levels
export var levelIndex: int = 0

func currentLevel():
	return levels[levelIndex]

func loadCurrentLevel():
	get_tree().change_scene(currentLevel().resource_path)

func nextLevel():
	if levelIndex + 1 >= levels.size():
		last_level()
		return
	levelIndex += 1
	loadCurrentLevel()

func last_level():
	if ScoreController.is_highscore():
		get_tree().change_scene("res://NewHighScore.tscn")
	else:
		get_tree().change_scene("res://GameOver.tscn")
