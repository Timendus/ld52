extends PathFollow

export var maxSpeed = 30
export var acceleration = 5
export var speed = 0
export var maxLaps = 3
var laps = 1

onready var label = get_tree().get_root().find_node("LapLabel", true, false)
func _ready():
	for n in range(laps +1,maxLaps + 1):
		var toHide = get_tree().get_nodes_in_group("lap%s" % str(n))
		for entry in toHide:
			entry.hide();
	
	var curve: Curve3D = get_parent().curve
	var origin = curve.interpolate_baked(offset, true)
	var forward = (curve.interpolate_baked(offset + 0.001, true) - origin).normalized()
	var up = forward.rotated(Vector3.RIGHT, PI/2)
	var right = forward.rotated(Vector3.UP, PI/2)
	transform = Transform(-forward, Vector3.UP, right, origin)

	
func _process(delta):
	speed = min(speed + acceleration * delta, maxSpeed)
	var oldOffset = offset
	offset = oldOffset + speed * delta
	if sign(offset - oldOffset) != sign(speed):
		# Offset got wrapped by Godot. It passed 1, so it was reset to 0,
		# or the other way around.
		laps += 1
		var toShow = get_tree().get_nodes_in_group("lap%s" % str(laps))
		for entry in toShow:
			entry.show();

		label.text = "Lap: %s/3" % str(laps)
		
		if laps > maxLaps: 
			$Player.emit_signal("finished_level")
	
