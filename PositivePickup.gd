extends Pickup

export var score: int = 1

func _on_pickedup(player):
	if (visible):
		player.emit_signal("score", score)
		queue_free()
