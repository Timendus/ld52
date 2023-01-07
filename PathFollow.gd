extends PathFollow

export var forwardSpeed = 30

func _process(delta):
	offset += delta * forwardSpeed
