extends Node

var menu_music = load("res://music/menu.mp3")
var track1_leader_music = load("res://music/track1-leader.mp3")
var track1_music = load("res://music/track1.mp3")
var track2_leader_music = load("res://music/track2-leader.mp3")
var track2_music = load("res://music/track2.mp3")

var playing = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	playMusic()

func play_track1():
	playing = 1
	$Music.stream = track1_leader_music
	$Music.play()

func play_track2():
	playing = 2
	$Music.stream = track2_leader_music
	$Music.play()
	
func playMusic():
	if playing == 0:
		$Music.stream = menu_music
		$Music.play()
	if playing == 1:
		$Music.stream = track1_music
		$Music.play()
	if playing == 2:
		$Music.stream = track2_music
		$Music.play()

func _on_Music_finished():
	playMusic()
