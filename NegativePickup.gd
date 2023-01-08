extends Pickup

func _on_pickedup(player):
	player.emit_signal("wrong");
	queue_free()
