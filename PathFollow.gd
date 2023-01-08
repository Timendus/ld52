extends PathFollow

export var maxSpeed = 30
export var acceleration = 5
export var speed = 0
export var maxLaps = 3
var laps = 0

onready var label = get_tree().get_root().find_node("LapLabel", true, false)

func _ready():
	print(label)

func _process(delta):
	speed = min(speed + acceleration * delta, maxSpeed)
	var oldOffset = offset
	offset = oldOffset + speed * delta
	if sign(offset - oldOffset) != sign(speed):
		# Offset got wrapped by Godot. It passed 1, so it was reset to 0,
		# or the other way around.
		laps += 1
		label.text = "Lap: %s/3" % str(laps)
		if laps > maxLaps: 
			$Player.emit_signal("finished_level")
	
