extends WorldEnvironment

export var finishScene: PackedScene

func _ready():
	var curve = $Path.curve
	var start = curve.interpolate_baked(0, false)
	var forward: Vector3 = (curve.interpolate_baked(0.01, false) - start).normalized()
	var up = forward.rotated(Vector3.RIGHT, PI/2)
	var right = forward.rotated(Vector3.UP, PI/2)
	var finishNode = finishScene.instance()
	finishNode.set_transform(Transform(forward, up, right, start))
	add_child(finishNode)
	
