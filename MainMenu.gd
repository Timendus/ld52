extends Node2D

export var mainGameScene : PackedScene


func _on_New_Game_Button_button_up():
	get_tree().change_scene(mainGameScene.resource_path)


func _on_Credits_Button_button_up():
	get_tree().change_scene("res://Credits.tscn")
