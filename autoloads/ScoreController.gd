# This still needs to be implemented.
# Miranda wants to do that tomorrow ;)

extends Node

var scores = [
	[ "Anne-Greeth", 	3000 ],
	[ "Bob", 			2500 ],
	[ "Miranda", 		2000 ],
	[ "Tim", 			1500 ],
	[ "Nick", 			1000 ]
]

var current_score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func reset_current_score():
	pass

func add_to_current_score(value):
	pass
	
func is_highscore():
	pass
	
func register_highscore(name):
	pass

func get_scores():
	return scores
