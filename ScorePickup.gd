extends Pickup

export var score: int = 1

func _on_pickedup(player):
	player.emit_signal("score", score)
	queue_free()
