# This still needs to be implemented.
# Miranda wants to do that tomorrow ;)

extends Node

var scores = [
	[ "Anne-Greeth", 	100 ],
	[ "Bob", 			75 ],
	[ "Miranda", 		50 ],
	[ "Tim", 			25 ],
	[ "Nick", 			10 ]
]

var current_score = 0

signal score_changed(new_score)

# Reset score to 0 when new game is started
func reset_current_score():
	current_score = 0

func add_to_current_score(value):
	current_score += value
	# Send signal to listeners that score has changed
	emit_signal("score_changed", current_score)
	
# Check if score at end of game is higher than lowest high score saved in scores list
func is_highscore():
	return current_score > scores[4][1]
	
# Save high score in scores list
func register_highscore(name):
	for i in range(scores.size()-1):
		if current_score > scores[i][1]:
			scores.insert(i, [name,current_score])
			break

func get_scores():
	return scores
