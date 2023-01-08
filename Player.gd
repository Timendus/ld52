extends RigidBody

signal score(score)
signal died()

export var strafeSpeed = 2
export var driftFactor = 100
export var forwardTexture: Texture
export var slideRightTexture: Texture
export var slideLeftTexture: Texture
var previousDirection = null

func _ready():
	pass # Replace with function body.


func _process(delta):
	var currentDirection = global_transform.basis.x
	var steering = (1 if Input.is_action_pressed("right") else 0) - (1 if Input.is_action_pressed("left") else 0)
	var drift = currentDirection.dot(previousDirection.rotated(Vector3.UP, PI/2)) if previousDirection != null else 0
	var slide = strafeSpeed * steering + drift * driftFactor
	var x = Vector3.FORWARD.dot(translation)
	x += delta * slide
	translation = Vector3.FORWARD * x
	
	previousDirection = currentDirection
	
	var texture = forwardTexture
	if steering > 0:
		texture = slideRightTexture
	elif steering < 0:
		texture = slideLeftTexture
		
	
	get_node("MeshInstance").get_surface_material(0).albedo_texture = texture

func _process_physics(delta):
	pass

func _on_Player_body_entered(body):
	body.emit_signal("pickedup", self)

func _on_Player_score(score):
	ScoreController.add_to_current_score(score)
