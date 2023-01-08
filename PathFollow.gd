extends PathFollow

export var maxSpeed = 30
export var acceleration = 5
export var speed = 0
export var maxLaps = 3
var laps = 0

func _process(delta):
	speed = min(speed + acceleration * delta, maxSpeed)
	var oldOffset = offset
	offset = oldOffset + speed * delta
	if sign(offset - oldOffset) != sign(speed):
		# Offset got wrapped by Godot. It passed 1, so it was reset to 0,
		# or the other way around.
		# TODO: Make sure this updates the lap counter
		laps += 1
		if laps > maxLaps: 
			$Player.emit_signal("finished_level")
	
