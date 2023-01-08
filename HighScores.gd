extends Node2D

export var mainGameScene : PackedScene

func _ready():
	# Ask score controller what the highscores currently are
	var scores = ScoreController.get_scores()

	# Render scores to labels
	$MarginContainer/VBoxContainer/VBoxContainer/MarginContainer5/Place1Text.text = scores[0][0]
	$MarginContainer/VBoxContainer/VBoxContainer/MarginContainer5/Place1Score.text = str(scores[0][1])
	$MarginContainer/VBoxContainer/VBoxContainer/MarginContainer2/Place2Text.text = scores[1][0]
	$MarginContainer/VBoxContainer/VBoxContainer/MarginContainer2/Place2Score.text = str(scores[1][1])
	$MarginContainer/VBoxContainer/VBoxContainer/MarginContainer4/Place3Text.text = scores[2][0]
	$MarginContainer/VBoxContainer/VBoxContainer/MarginContainer4/Place3Score.text = str(scores[2][1])
	$MarginContainer/VBoxContainer/VBoxContainer/MarginContainer6/Place4Text.text = scores[3][0]
	$MarginContainer/VBoxContainer/VBoxContainer/MarginContainer6/Place4Score.text = str(scores[3][1])
	$MarginContainer/VBoxContainer/VBoxContainer/MarginContainer7/Place5Text.text = scores[4][0]
	$MarginContainer/VBoxContainer/VBoxContainer/MarginContainer7/Place5Score.text = str(scores[4][1])

func _on_Back_Button_button_up():
	get_tree().change_scene(mainGameScene.resource_path)
