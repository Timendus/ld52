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
	MusicController.engine_start()

func _process(delta):
	var forward = get_parent().transform.basis.x
	var up = get_parent().transform.basis.y
	var right = get_parent().transform.basis.z
	
	$LeftParticles.emitting = Input.is_action_pressed("left")
	$RightParticles.emitting = Input.is_action_pressed("right")
	
	var steering = (1 if Input.is_action_pressed("right") else 0) - (1 if Input.is_action_pressed("left") else 0)
	var drift = right.dot(previousDirection) + up.dot(previousDirection) * 0.1 if previousDirection != null else 0
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
	MusicController.playSFX(MusicController.PICKUP)
	
func _on_Player_wrong():
	ScoreController.add_to_current_score(-10)
	MusicController.playSFX(MusicController.CHICKEN)
	
func _on_Player_finished_level():
	MusicController.engine_stop()
	MusicController.playSFX(MusicController.LEVEL)
	LevelController.nextLevel()

func _on_Player_died():
	MusicController.engine_stop()
	if ScoreController.is_highscore():
		get_tree().change_scene("res://NewHighScore.tscn")
	else:
		get_tree().change_scene("res://GameOver.tscn")
