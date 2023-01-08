extends PathFollow

export var maxSpeed = 30
export var acceleration = 5
export var speed = 0

func _process(delta):
	speed = min(speed + acceleration * delta, maxSpeed)
	offset += speed * delta
