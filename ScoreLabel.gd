extends Label

func _ready():
	ScoreController.connect("score_changed", self, "update_score_label")

func update_score_label(score):
	text = "Score: %s" % score
