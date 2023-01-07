extends RigidBody

func _ready():
	pass # Replace with function body.


func _process(delta):
	if Input.is_action_pressed("forward"):
		apply_central_impulse(global_transform.basis.x * 100 * delta)
	var steering = (1 if Input.is_action_pressed("right") else 0) - (1 if Input.is_action_pressed("left") else 0)
	apply_torque_impulse(Vector3(0, -1, 0) * steering * 0.01)

func _process_physics(delta):
	pass
