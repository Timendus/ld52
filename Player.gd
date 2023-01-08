extends RigidBody

signal score(score)
signal wrong()
signal died()
signal finished_level()

export var strafeSpeed = 2
export var driftFactor = 100
export var forwardTexture: Texture
export var slideRightTexture: Texture
export var slideLeftTexture: Texture
var previousDirection = null

func _ready():
	pass # Replace with function body.


func _process(delta):
	var forward = get_parent().transform.basis.x
	var up = get_parent().transform.basis.y
	var right = get_parent().transform.basis.z
	
	var steering = (1 if Input.is_action_pressed("right") else 0) - (1 if Input.is_action_pressed("left") else 0)
	var drift = right.dot(previousDirection) - up.dot(previousDirection) if previousDirection != null else 0
	var slide = strafeSpeed * steering + drift * driftFactor
	var x = Vector3.FORWARD.dot(translation)
	
	x += delta * slide
	
	if abs(x) > 2.5:
		# Drifted from road.
		# Keep player on road.
		x = sign(x) * 2.5
		# Decrease speed significantly
		get_parent().speed *= 0.5

	translation = Vector3.FORWARD * x
	
	previousDirection = forward
	
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
	
func _on_Player_wrong():
	ScoreController.add_to_current_score(-10)
	
func _on_Player_finished_level():
	LevelController.nextLevel()
