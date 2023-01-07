extends Node2D

export var mainGameScene : PackedScene

func _ready():
	pass

func _on_New_Game_Button_button_up():
	get_tree().change_scene(mainGameScene.resource_path)
	#MusicController.play_track1()
	MusicController.play_track2()

func _on_Credits_Button_button_up():
	get_tree().change_scene("res://Credits.tscn")

func _on_High_Scores_Button_button_up():
	get_tree().change_scene("res://HighScores.tscn")
