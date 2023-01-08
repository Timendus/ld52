extends Label

func _ready():
	ScoreController.connect("score_changed", self, "update_score_label")
	text = "Score: %s" % ScoreController.current_score

func update_score_label(score):
	text = "Score: %s" % score
