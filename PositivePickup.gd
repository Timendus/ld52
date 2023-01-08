extends Pickup

export var score: int = 1

func _on_pickedup(player):
	if !visible:
		return
	player.emit_signal("score", score)
	hide()
	queue_free()
