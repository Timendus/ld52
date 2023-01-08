extends Pickup

func _on_pickedup(player):
	if (visible):
		player.emit_signal("wrong");
		queue_free()
