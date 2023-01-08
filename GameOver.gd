extends Node2D

export var mainGameScene : PackedScene

func _ready():
	MusicController.play_menu()

func _on_Save_Button_button_up():
	get_tree().change_scene(mainGameScene.resource_path)
