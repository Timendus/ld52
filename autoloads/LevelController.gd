extends Node
export(Array, PackedScene) var levels
export var levelIndex: int = 0

func currentLevel():
	return levels[levelIndex]

func loadCurrentLevel():
	get_tree().change_scene(currentLevel().resource_path)

func nextLevel():
	if levelIndex + 1 >= levels.size():
		return
	levelIndex += 1
	loadCurrentLevel()
