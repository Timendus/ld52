extends Pickup

func _on_pickedup(player):
	if (visible):
		player.emit_signal("died")
		queue_free()
