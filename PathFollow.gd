extends PathFollow

export var forwardSpeed = 30
export var strafeSpeed = 2
export var driftFactor = 100
var previousDirection = null


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	offset += delta * forwardSpeed
	var steering = (1 if Input.is_action_pressed("right") else 0) - (1 if Input.is_action_pressed("left") else 0)
	var player = get_node("Player")
	var drift = transform.basis.x.dot(previousDirection.rotated(Vector3.UP, PI/2)) if previousDirection != null else 0
	var slide = strafeSpeed * steering + drift * driftFactor
	player.translate_object_local(Vector3.FORWARD * delta * slide)
	
	previousDirection = transform.basis.x
